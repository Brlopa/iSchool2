//
//  TabBar.swift
//  iSchool
//
//  Created by Bruno on 03.02.20.
//  Copyright © 2020 Thomas. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            Home().tabItem{
                Image(systemName: "house.fill")
                Text("Start")
                Text("Test")
            }
           // Dictionary().tabItem{
           //     Image(systemName: "doc.text.magnifyingglass")
            //    Text("Dictionary")
            
            Settings().tabItem{
                Image(systemName: "gear")
                Text("Settings")
            }
            
            PracticeNew().tabItem{
                Image(systemName: "house.fill")
                Text("PDF")
                }
            }
        }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
