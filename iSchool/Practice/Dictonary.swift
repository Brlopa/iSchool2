//
//  Dictonary.swift
//  iSchool
//
//  Created by Bruno on 07.02.20.
//  Copyright © 2020 Thomas. All rights reserved.
//

import SwiftUI

struct Dictonary: View {
    
    @State var ShowShareSheet = false
    var dictionaryData = Model.currentModel.dictionarys
    
    
    var body: some View {
        NavigationView{
            VStack{
                List(dictionaryData){ dictionary  in
                    NavigationLink(destination: DictionaryDetail(name: dictionary, topic: dictionary,top: dictionary, topicitem: dictionary)) {
////                                                  Ändern fur Live Preview
//                        name: dictionary
                      HStack{
                          Text(dictionary.name)
                      }
                    
                    
//                        Image(dictionary.image)
//                            .resizable()
                        //                            .frame(width: 40, height: 40)
                        
                        //                        .font(Font.custom("SF Pro Text Bold", size: 18))
                        
                    }.navigationBarTitle(Text("Dictionary"))
                   
                }.listRowBackground(Color.gray)
            }
        }
    }
}
 
struct Dictonary_Previews: PreviewProvider {
    static var previews: some View {
        Dictonary()
    }
}
