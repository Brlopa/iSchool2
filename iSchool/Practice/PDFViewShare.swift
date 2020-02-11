//
//  PDFViewShare.swift
//  iSchool
//
//  Created by Bruno on 06.02.20.
//  Copyright © 2020 Thomas. All rights reserved.
//

import SwiftUI
import PDFKit

struct PDFViewShare: View {
    @State var ShowShareSheet = false
    

    var PdfUrl = Model.currentModel.pdfs
    
    let document = PDFDocument(url: Bundle.main.url(forResource: "Geografie-Probe-2", withExtension: "pdf")!)
    
    let PDFData = Model.pdf
    
    var body: some View {
        NavigationView{
            PDFKitView(url: Bundle.main.url(forResource: "Geografie-Probe-2", withExtension: "pdf"))
            .navigationBarItems(trailing:
                Button("Share") {
                    self.ShowShareSheet = true
                }.sheet(isPresented: $ShowShareSheet, content: {
                    ShareSheet(activityItems: [self.document!.dataRepresentation()])
                })
                
            )
        }

        
    }
}

struct PDFViewShare_Previews: PreviewProvider {
    static var previews: some View {
        PDFViewShare()
    }
}
