import SwiftUI
import PhotosUI
import SwiftData

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
            fail("Couldn't delete the painting. Please try again.")
        }
    }

    /// Deletes every entry whose ID is in selectedIDs.
    /// The ViewModel receives what it needs as parameters — it has no access
    /// to @Query or @Environment, those belong to the View.
    /// Resetting isSelecting/selectedEntries is the View's job after this returns.
    func deleteSelectedEntries(
        _ selectedIDs: Set<JournalEntry.ID>,
        from entries: [JournalEntry],
        context: ModelContext
    ) {
        entries
            .filter { selectedIDs.contains($0.id) }
            .forEach { delete($0, from: context) }
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
            fail("Couldn't load that photo. Try a different one.")
            return nil
        }
    }

    // MARK: - Palette extraction

    /// Resizes an image and extracts its four dominant colors.
    func extractPalette(from originalImage: UIImage) async throws -> [Color] {

        let targetSize = CGSize(width: 100, height: 100)

        let resizedImage = await Task.detached(priority: .userInitiated) {
            await originalImage.resize(to: targetSize)
        }.value

        guard let resizedImage else {
            throw CocoaError(.coderInvalidValue)
        }

        let colors = try await extractor.extract(from: resizedImage)

        logger.debug("Extracted \(colors.count) colors")

        return colors
    }

    // MARK: - Journal creation

    /// Creates and persists a JournalEntry using an already extracted palette.
    /// This avoids running DominantColors a second time.
    func createJournalEntry(
        from originalImage: UIImage,
        palette: [Color],
        into context: ModelContext
    ) async {

        do {

            let generatedPainting = generator.generate(from: palette)

            let referenceIdentifier = try imageStore.saveReference(originalImage)

            let paintingIdentifier = try imageStore.savePainting(generatedPainting)

            let entry = JournalEntry(
                referenceImageIdentifier: referenceIdentifier,
                paintingImageIdentifier: paintingIdentifier,
                paletteHex: palette.map(\.hex)
            )

            context.insert(entry)
            try context.save()

            logger.debug("Journal entry saved successfully.")

        } catch {

            logger.error("Failed to save journal entry: \(error.localizedDescription)")
            fail("Couldn't save your painting.")

        }

    }

    // MARK: - Backwards compatibility

    /// Legacy helper that performs the full pipeline.
    /// New code should call extractPalette() followed by
    /// createJournalEntry().
    func process(
        _ originalImage: UIImage,
        into context: ModelContext
    ) async {

        do {

            let palette = try await extractPalette(from: originalImage)

            await createJournalEntry(
                from: originalImage,
                palette: palette,
                into: context
            )

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
