//
//  Detail.swift
//  iSchool
//
//  Created by Bruno on 29.09.19.
//  Copyright © 2019 Thomas. All rights reserved.
//

import SwiftUI

struct Detail: View {
    
    @State var show = false
    
    var body: some View {
        Home()
        .blur(radius: show ? 15 : 0)
        
        
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail()
    }
}
