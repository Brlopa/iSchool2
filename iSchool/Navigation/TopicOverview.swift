//
//  TopicOverview.swift
//  iSchool
//
//  Created by Bruno on 07.12.19.
//  Copyright © 2019 Thomas. All rights reserved.
//

import SwiftUI

var card = TopicRectangleData

struct TopicOverview: View {
   
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    ScrollView{
                        ForEach(card) { item in
                            ZStack(alignment: .topLeading){
                                Rectangle()
                                    .frame(width: 113, height: 173)
                                    .foregroundColor(.blue)
                                    .cornerRadius(10)
                                VStack{
                                    Text(item.Topic)
                                    Text(item.Course)
                                    
                                }
                            }
                        }
                    }
                }
                HStack{
                    ForEach(card) { item in
                        ZStack(alignment: .topLeading){
                            Rectangle()
                                .frame(width: 113, height: 173)
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                            VStack{
                                Text(item.Topic)
                                Text(item.Course)
                                
                            }
                        }
                    }
                }
            }.navigationBarTitle(Text("Practice"))
        }
    }
}


struct TopicOverview_Previews: PreviewProvider {
    static var previews: some View {
        TopicOverview()
    }
}

struct ToData : Identifiable {
    var id = UUID()
    var Topic : String
    var Course : String
    var Color : UIColor

    
}

let TopicRectangleData = [
ToData(Topic: "Kräfte", Course: "Physik", Color: .green),
ToData(Topic: "Kräfte", Course: "Physik", Color: .green),
ToData(Topic: "Kräfte", Course: "Physik", Color: .green),
ToData(Topic: "Kräfte", Course: "Physik", Color: .green)]
