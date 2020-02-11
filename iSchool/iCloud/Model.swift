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

import Foundation
import CloudKit
import Combine

class Model {
    // MARK: - iCloud Info
    let container: CKContainer
    let publicDB: CKDatabase
    let privateDB: CKDatabase
    
    // MARK: - Properties
    private(set) var courses: [Course] = []
    private(set) var pdfs: [PDF] = []
    private(set) var dictionarys: [DictionaryData] = []
    static var currentModel = Model()
    
    init() {
        container = CKContainer.default()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
    }
    
    @objc func refresh(_ completion: @escaping (Error?) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Course", predicate: predicate)
        course(forQuery: query) { (_) in
        let query2 = CKQuery(recordType: "PDF", predicate: predicate)
            self.pdf(forQuery: query2, completion)
        let query3 = CKQuery(recordType: "Dictionary", predicate: predicate)
        self.dictionary(forQuery: query3, completion)
        }
    }
    
    
    private func course(forQuery query: CKQuery, _ completion: @escaping (Error?) -> Void) {
        publicDB.perform(query, inZoneWith: CKRecordZone.default().zoneID) { [weak self] results, error in
            guard let self = self else { return }
            if let error = error {
                DispatchQueue.main.async {
                    completion(error)
                }
                return
            }
            guard let results = results else { return }
            self.courses = results.compactMap {
                Course(record: $0, database: self.publicDB)
            }
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
    func pdf(forQuery query: CKQuery, _ completion: @escaping (Error?) -> Void) {
        publicDB.perform(query, inZoneWith: CKRecordZone.default().zoneID) { [weak self] results, error in
            guard let self = self else { return }
            if let error = error {
                DispatchQueue.main.async {
                    completion(error)
                }
                return
            }
            guard let results = results else { return }
            self.pdfs = results.compactMap {
                PDF(record: $0, database: self.publicDB)
            }
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
    func dictionary(forQuery query: CKQuery, _ completion: @escaping (Error?) -> Void) {
        publicDB.perform(query, inZoneWith: CKRecordZone.default().zoneID) { [weak self] results, error in
            guard let self = self else { return }
            if let error = error {
                DispatchQueue.main.async {
                    completion(error)
                }
                return
            }
            guard let results = results else { return }
            self.dictionarys = results.compactMap {
                DictionaryData(record: $0, database: self.publicDB)
            }
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
}
