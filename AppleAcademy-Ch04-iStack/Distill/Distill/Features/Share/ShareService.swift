import SwiftUI

@Observable
final class ShareService {

    var itemsToShare: [Any] = []

    var isShowingShareSheet = false

    func share(_ image: UIImage) {

        itemsToShare = [image]
        isShowingShareSheet = true

    }

    func share(_ images: [UIImage]) {

        itemsToShare = images
        isShowingShareSheet = true

    }

}
