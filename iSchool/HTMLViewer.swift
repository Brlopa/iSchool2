//
//  HTMLViewer.swift
//  iSchool
//
//  Created by Bruno on 09.02.20.
//  Copyright © 2020 Thomas. All rights reserved.
//


import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?

    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
