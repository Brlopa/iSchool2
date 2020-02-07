/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import MapKit
import CloudKit
import CoreLocation
import PDFKit

class PDF: Identifiable {
    enum ChangingTable: Int {
        case none
        case womens
        case mens
        case both
    }
    
    static let recordType = "PDF"
    internal let id: CKRecord.ID
    let name: String
    let pdf: CKAsset
    let database: CKDatabase
    
    // private(set) var notes: [Note]? = nil
    
    init?(record: CKRecord, database: CKDatabase) {
        guard
            let pdf = record["pdf"] as? CKAsset,
            let name = record["Name"] as? String
            else { return nil }
        id = record.recordID
        self.name = name
        self.pdf = pdf
        
        //self.location = location
        //coverPhoto = record["coverPhoto"] as? CKAsset
        self.database = database
        //healthyOption = record["healthyOption"] as? Bool ?? false
        //kidsMenu = record["kidsMenu"] as? Bool ?? false
        // if let changingTableValue = record["changingTable"] as? Int,
        //     let changingTable = ChangingTable(rawValue: changingTableValue) {
        //      self.changingTable = changingTable
        //    } else {
        //     self.changingTable = .none
        //    }
        //   if let noteRecords = record["notes"] as? [CKRecord.Reference] {
        // Note.fetchNotes(for: noteRecords) { notes in
        // self.notes = notes
        //       }
    }
    
    
    //  Wird nicht gebaraucht!
    
    func loadPDF(completion: @escaping (_ pdf: PDFKitView?) -> ()) {
      DispatchQueue.global(qos: .utility).async {
        var pdfView: PDFKitView?
        defer {
          DispatchQueue.main.async {
            completion(pdfView)
          }
        }
        guard
            let fileURL = self.pdf.fileURL
          else {
            return
        }
        pdfView = PDFKitView(url: fileURL)
      }
    }
}






extension PDF: Hashable {
    static func == (lhs: PDF, rhs: PDF) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
