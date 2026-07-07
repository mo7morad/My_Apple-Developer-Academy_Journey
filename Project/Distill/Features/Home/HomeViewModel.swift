import SwiftUI
import PhotosUI
import SwiftData
import os

@Observable
@MainActor
final class HomeViewModel {

    // MARK: - Presented state

    var errorMessage: String?
    var isShowingError = false

    // MARK: - Dependencies

    private let imageStore = ImageStore()
    private let generator = PaintingGenerator()
    private let extractor = DominantColorExtractor()

    private let logger = Logger(
        subsystem: "com.morad.Distill",
        category: "ColorExtraction"
    )

    // MARK: - Painting loading

    func loadPainting(identifier: String) -> UIImage? {
        imageStore.loadPainting(identifier: identifier)
    }

    // MARK: - Deletion

    /// Deletes one entry's files from disk and removes its SwiftData record.
    /// Errors are surfaced via the existing alert mechanism.
    func delete(_ entry: JournalEntry, from context: ModelContext) {
        imageStore.deletePainting(identifier: entry.paintingImageIdentifier)
        imageStore.deleteReference(identifier: entry.referenceImageIdentifier)
        context.delete(entry)
        do {
            try context.save()
        } catch {
            logger.error("Failed to delete entry: \(error.localizedDescription)")
            fail("Couldn't delete the painting. Please try again.")
        }
    }
    
    /// Deletes every entry whose ID is in selectedIDs.
    /// The ViewModel receives what it needs as parameters — it has no access
    /// to @Query or @Environment, those belong to the View.
    /// Resetting isSelecting/selectedEntries is the View's job after this returns.
    func deleteSelectedEntries(_ selectedIDs: Set<JournalEntry.ID>, from entries: [JournalEntry], context: ModelContext) {
        entries
            .filter { selectedIDs.contains($0.id) }
            .forEach { delete($0, from: context) } // calls the single-entry delete above
    }

    // MARK: - Photo pipeline

    /// Loads the picked photo into a `UIImage` so it can be shown while
    /// the generation screen is on-screen. Returns `nil` (and surfaces an
    /// alert) if the photo can't be decoded.
    func loadImage(from item: PhotosPickerItem) async -> UIImage? {
        do {
            guard
                let data = try await item.loadTransferable(type: Data.self),
                let originalImage = UIImage(data: data)
            else {
                fail("Couldn't load that photo. Try a different one.")
                return nil
            }
            return originalImage
        } catch {
            logger.error("Failed to load photo: \(error.localizedDescription)")
            fail("Couldn't load that photo. Try a different one.")
            return nil
        }
    }

    /// Turns an already-loaded photo into a saved `JournalEntry`:
    /// resize → extract colors → generate painting → persist.
    func process(_ originalImage: UIImage, into context: ModelContext) async {
        do {
            // Downscale off the main actor so the UI never stalls.
            let targetSize = CGSize(width: 100, height: 100)
            let resizedImage = await Task.detached(priority: .userInitiated) {
                await originalImage.resize(to: targetSize)
            }.value

            guard let resizedImage else {
                fail("Failed to process the image.\nPlease try again.")
                return
            }

            let colors = try await extractor.extract(from: resizedImage)
            logger.debug("Extracted \(colors.count) colors")

            let generatedPainting = generator.generate(from: colors)

            let referenceIdentifier = try imageStore.saveReference(originalImage)
            let paintingIdentifier = try imageStore.savePainting(generatedPainting)

            let entry = JournalEntry(
                referenceImageIdentifier: referenceIdentifier,
                paintingImageIdentifier: paintingIdentifier,
                paletteHex: colors.map(\.hex)
            )
            context.insert(entry)

            try context.save()
            logger.debug("Journal entry saved successfully.")

        } catch {
            logger.error("Color extraction failed: \(error.localizedDescription)")
            fail("Something went wrong. Please try again.")
        }
    }

    // MARK: - Helpers

    private func fail(_ message: String) {
        errorMessage = message
        isShowingError = true
    }
}
