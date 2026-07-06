// TEST: makes a fake painting based on dominantcolors output

import SwiftUI
import UIKit

struct PaintingGenerator {

    private let canvasSize: CGFloat = 650

    func generate(from colors: [Color]) -> UIImage {

        let renderer = UIGraphicsImageRenderer(
            size: CGSize(width: canvasSize, height: canvasSize)
        )

        return renderer.image { context in

            let cg = context.cgContext

            let rectangles = [
                CGRect(x: 0, y: 0,
                       width: canvasSize * 0.62,
                       height: canvasSize * 0.47),

                CGRect(x: canvasSize * 0.62, y: 0,
                       width: canvasSize * 0.38,
                       height: canvasSize * 0.55),

                CGRect(x: 0, y: canvasSize * 0.47,
                       width: canvasSize * 0.45,
                       height: canvasSize * 0.53),

                CGRect(x: canvasSize * 0.45,
                       y: canvasSize * 0.55,
                       width: canvasSize * 0.55,
                       height: canvasSize * 0.45)
            ]

            for (index, rect) in rectangles.enumerated() {

                guard index < colors.count else { continue }

                cg.setFillColor(
                    UIColor(colors[index]).cgColor
                )

                cg.fill(rect)
            }

        }

    }

}
