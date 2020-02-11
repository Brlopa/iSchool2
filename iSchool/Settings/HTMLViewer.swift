//
//  HTMLViewer.swift
//  iSchool
//
//  Created by Bruno on 09.02.20.
//  Copyright © 2020 Thomas. All rights reserved.
//

import SwiftUI
import WebKit

struct HTMLViewer: View {
    var body: some View {
        VStack{
            WebView(request: URLRequest(url: URL(string: "https://developer.apple.com")!))
            
        }.edgesIgnoringSafeArea(.all)
    }
}
struct WebView: UIViewRepresentable{
    let request: URLRequest
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context:Context) {
        uiView.load(request)
    }
}
