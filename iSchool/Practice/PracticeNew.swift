//
//  PracticeNew.swift
//  iSchool
//
//  Created by Bruno on 06.02.20.
//  Copyright © 2020 Thomas. All rights reserved.
//

import SwiftUI
import PDFKit

struct PracticeNew: View {
    @State var ShowShareSheet = false
    var pdfs = Model.currentModel.pdfs
    
//    let document = PDFDocument(url: Bundle.main.url(forResource: "Geografie-Probe-2", withExtension: "pdf")!)
    
    var body: some View {
        NavigationView{
            List(pdfs){ pdf in
                NavigationLink(destination: PDFViewShare()) {
                    HStack{
                        Text(pdf.name)
                            .navigationBarTitle(Text("PDF"))
                            .navigationBarItems(trailing:
                                Button("Share") {
                                    self.ShowShareSheet = true
                                }.sheet(isPresented: self.$ShowShareSheet, content: {
                                    ShareSheet(activityItems: [pdf.pdf.fileURL!])
                                })
                        )
                    }
                    
                }
            }
        }
        
    }
}

struct PracticeNew_Previews: PreviewProvider {
    static var previews: some View {
        PracticeNew()
    }
}

struct PDFData : Identifiable {
    var id = UUID()
    var name: String
    var path: URL {
        return Bundle.main.url(forResource: name, withExtension: "pdf")!
    }
}

let PDFDataArray = [PDFData(name: "Geografie Probe 2"),PDFData( name: "Test")
]
