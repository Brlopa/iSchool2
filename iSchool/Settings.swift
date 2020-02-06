//
//  Settings.swift
//  iSchool
//
//  Created by Bruno on 03.02.20.
//  Copyright © 2020 Thomas. All rights reserved.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView{
            List{
                Text("Hello")
                .frame(height: 20)
                .navigationBarTitle(Text("Settings"))
                Text("Hello")
                .frame(height: 20)
                
        }
       
    }
}
}
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
