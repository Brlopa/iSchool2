//
//  DictionaryDetail.swift
//  iSchool
//
//  Created by Bruno on 08.02.20.
//  Copyright © 2020 Thomas. All rights reserved.
//

import SwiftUI

//let todoItems: [DictionaryData] = [
//topi(topicitemdata: "Writing a blogpost about SwiftUI"),
//TopicItemData(topicitemdata: "Walk with the dog"),
//TopicItemData(topicitemdata: "Drink a beer")]

struct DictionaryDetail: View {
    //    var TestData = TestDataS
    
    var DictionaryData = Model.currentModel.dictionarys
    
    //  Ändern für Live Preview
    var name : DictionaryData
    var topic: DictionaryData
    var top: DictionaryData
    var topicitem: DictionaryData
    
    
    
    
    //    var name: TestData
    //    var topic: TestData
    //    var top: TestData
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        Text("Top Erklärungen")
                            .font(.headline)
                            .padding(.leading)
                        Spacer()
                    }
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(0..<3){ box in
                                ZStack(alignment: .topLeading){
                                    Rectangle()
                                        .frame(width: 120, height: 160)
                                        .foregroundColor(Color(#colorLiteral(red: 0.0009274088661, green: 0.02324046195, blue: 0.2609408498, alpha: 1)))
                                        .cornerRadius(11)
                                    Text(self.top.dictionaryTop[0])
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .frame(width: 90, height: /*@START_MENU_TOKEN@*/160.0/*@END_MENU_TOKEN@*/,alignment: .topLeading)
                                        .padding(.top)
                                        .padding(.leading)
                                }
                            }
                        }
                        }.padding(.leading,16)
                    HStack{
                        Text(topic.dictionaryTopic)
                            .font(.headline)
                            .padding(.leading)
                        Spacer()
                    }.padding(.top,32)
                    Spacer()
                    List(SettingsData) { item in
                        HStack{
                            Image(systemName: item.image)
                                .foregroundColor(.blue)
                            Text(item.content)
                        }
                    }
                }.navigationBarTitle(name.name)
                    .padding(.top,16)
                //            name.name
                //            Ändern für Live Preview
            }
        }.padding(.top,-2)
        
    }
}

struct TestData : Identifiable {
    var id = UUID()
    var text: String
    
}

//let TestDataS = [
//    TestData(text: "Test",dictionaryTop: "Kräfte",dictionaryTopic: "Physik"),
//    TestData(text: "Test",dictionaryTop: "Albegra",dictionaryTopic: "Math"),
//    TestData(text: "Test",dictionaryTop: "Grammatik",dictionaryTopic: "Deutsch")
//
//]


//struct DictionaryDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        DictionaryDetail()
//    }
//}

struct TopicItemData: Identifiable {
    var id = UUID()
    var topicitemdata: String
}
