import SwiftUI
import PDFKit

struct PDFKitView : UIViewRepresentable {
    
    var url: URL?
    
    func makeUIView(context: Context) -> UIView {
        let pdfView = PDFView()

        if let url = url {
            pdfView.document = PDFDocument(url: url)
        }
        
        return pdfView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Empty
    }
    
}
