// TEST: stores ref photo and fake painting (this might be usable in final)

import UIKit

struct ImageStore {

    private let fileManager = FileManager.default

    private var paintingsDirectory: URL {
        let documents = fileManager.urls(for: .documentDirectory,
                                         in: .userDomainMask)[0]

        let directory = documents.appendingPathComponent("Paintings")

        if !fileManager.fileExists(atPath: directory.path) {
            try? fileManager.createDirectory(
                at: directory,
                withIntermediateDirectories: true
            )
        }

        return directory
    }

    private var referencesDirectory: URL {
        let documents = fileManager.urls(for: .documentDirectory,
                                         in: .userDomainMask)[0]

        let directory = documents.appendingPathComponent("References")

        if !fileManager.fileExists(atPath: directory.path) {
            try? fileManager.createDirectory(
                at: directory,
                withIntermediateDirectories: true
            )
        }

        return directory
    }

    @discardableResult
    func saveReference(_ image: UIImage) throws -> String {

        let identifier = UUID().uuidString + ".jpg"

        let url = referencesDirectory.appendingPathComponent(identifier)

        guard let data = image.jpegData(compressionQuality: 0.95) else {
            throw CocoaError(.fileWriteUnknown)
        }

        try data.write(to: url)

        return identifier
    }

    @discardableResult
    func savePainting(_ image: UIImage) throws -> String {

        let identifier = UUID().uuidString + ".png"

        let url = paintingsDirectory.appendingPathComponent(identifier)

        guard let data = image.pngData() else {
            throw CocoaError(.fileWriteUnknown)
        }

        try data.write(to: url)

        return identifier
    }

    func loadPainting(identifier: String) -> UIImage? {

        let url = paintingsDirectory.appendingPathComponent(identifier)

        return UIImage(contentsOfFile: url.path)
    }

    func loadReference(identifier: String) -> UIImage? {

        let url = referencesDirectory.appendingPathComponent(identifier)

        return UIImage(contentsOfFile: url.path)
    }

    func deletePainting(identifier: String) {

        let url = paintingsDirectory.appendingPathComponent(identifier)

        try? fileManager.removeItem(at: url)
    }

    func deleteReference(identifier: String) {

        let url = referencesDirectory.appendingPathComponent(identifier)

        try? fileManager.removeItem(at: url)
    }

}
