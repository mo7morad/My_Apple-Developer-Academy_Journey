import SwiftUI
import UIKit
import DominantColors

struct DominantColorExtractor {

    func extract(from image: UIImage) async throws -> [Color] {
        try await Task.detached(priority: .userInitiated) {
            let uiColors = try DominantColors.dominantColors(
                uiImage: image,
                maxCount: 4
            )

            return uiColors.map(Color.init)
        }.value
    }

}
