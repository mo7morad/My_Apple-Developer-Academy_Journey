import SwiftUI
import PencilKit

struct PencilCanvasView: UIViewRepresentable {

    @Binding
    var drawing: PKDrawing

    let tool: PKTool

    func makeCoordinator() -> Coordinator {
        Coordinator(drawing: $drawing)
    }

    func makeUIView(context: Context) -> UIScrollView {

        let scrollView = UIScrollView()

        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 5.0
        scrollView.zoomScale = 1.0

        scrollView.bouncesZoom = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = context.coordinator

        let canvas = PKCanvasView()

        canvas.translatesAutoresizingMaskIntoConstraints = false

        canvas.backgroundColor = .white
        canvas.isOpaque = true

        canvas.drawing = drawing
        canvas.tool = tool
        canvas.delegate = context.coordinator

        canvas.drawingPolicy = .pencilOnly

        canvas.alwaysBounceVertical = false
        canvas.alwaysBounceHorizontal = false

        scrollView.addSubview(canvas)

        NSLayoutConstraint.activate([

            canvas.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            canvas.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            canvas.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            canvas.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),

            canvas.widthAnchor.constraint(equalToConstant: 650),
            canvas.heightAnchor.constraint(equalToConstant: 650)

        ])

        context.coordinator.canvasView = canvas

        return scrollView
    }

    func updateUIView(
        _ scrollView: UIScrollView,
        context: Context
    ) {

        guard let canvas = context.coordinator.canvasView else {
            return
        }

        if canvas.drawing != drawing &&
            !context.coordinator.isUpdatingFromDelegate {

            canvas.drawing = drawing
        }

        canvas.tool = tool
    }

    final class Coordinator: NSObject,
                             UIScrollViewDelegate,
                             PKCanvasViewDelegate {

        var drawing: Binding<PKDrawing>

        weak var canvasView: PKCanvasView?

        var isUpdatingFromDelegate = false

        init(drawing: Binding<PKDrawing>) {
            self.drawing = drawing
        }

        func viewForZooming(
            in scrollView: UIScrollView
        ) -> UIView? {

            canvasView

        }

        func canvasViewDrawingDidChange(
            _ canvasView: PKCanvasView
        ) {

            isUpdatingFromDelegate = true

            drawing.wrappedValue = canvasView.drawing

            isUpdatingFromDelegate = false

        }

    }

}
