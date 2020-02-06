//
//  PracticeTopic.swift
//  iSchool
//
//  Created by Bruno on 24.11.19.
//  Copyright © 2019 Thomas. All rights reserved.
//

import SwiftUI



let description = ["Physik", "GRUNDLAGEN", "Ff = Fg", "Hier lernst du unsere Umgebung besser zu verstehen und kannst verschiedene Kräfte berechnen und anwenden.", "newton", "Du hast ein allgemeines Verständnis für das Aufeinanderwirken von unterschiedlichen Kräften. Du verstehst welche Kräfte in verschiedenen Konstellationen, wie wirken und welche für welche Aktionen zuständig sind. "]
 
var image = descriptionImageData
var url = "https://apple.com"

struct PracticeTopicUI: View {
var body: some View {
    ScrollView(showsIndicators: false){
    VStack(alignment: .leading)
        {
        ZStack(alignment: .topLeading){
            Rectangle()
                .frame(height: 334)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text(description[0])
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                    Text(description[1])
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                }.padding(.top, 60) .padding(.leading)
            
                VStack(alignment: .center, spacing: 24){
                    Text(description[2])
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    
                    Text(description[3])
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                }.padding(.leading) .padding(.top, 75)
            }
        }
        
 
            VStack{
                VStack(alignment: .leading){
                    Text("Material")
                        .font(.headline)
                    
                    
                    ForEach(image) { item in
                        HStack{
                            Image(item.Image)
                                .resizable()
                                .frame(width: 55, height: 70)
                                .cornerRadius(9)
                            //Image
                            VStack(alignment: .leading){
                                Text(item.Difficulty)
                                    .font(.callout)
                                    .foregroundColor(.gray)
                                    .fontWeight(.semibold)
                                Text(item.documentName)
                                    .font(.headline)
                                //Description
                            }
                        }
                    }
                }
            }.padding(.top, 25) .padding(.leading, 18)
            //allgemeiner padding(.leading)
            Spacer()
            
            VStack{
                Text("Lernziele")
                    .font(.headline)
                Text(description[5])
                    .font(.body)
                    .padding(.leading, 18)
            }.padding(.top, 25) .padding(.leading, 18)
            
            
            
        }
    
    }
    
    }
    
    
}
struct PracticeTopicUI_Previews: PreviewProvider {
            static var previews: some View {
                PracticeTopicUI()
            }
        }
        
 
struct DImage : Identifiable {
    var id = UUID()
    var Image: String
    var Difficulty : String
    var documentName : String
    var Url: String
}

let descriptionImageData = [
    DImage(Image: "newton", Difficulty: "Einfach", documentName: "Kräfte erklärt", Url: "file:///Volumes/G-DRIVE%20mobile%20USB-C/2019/iSchool/Images/Radioactivity%20Script.html"),
    DImage(Image: "rover", Difficulty: "Einfach", documentName: "Ortskraft", Url: "file:///Volumes/G-DRIVE%20mobile%20USB-C/2019/iSchool/Images/Radioactivity%20Script.html"),
    DImage(Image: "newton", Difficulty: "Einfach", documentName: "Federkraft", Url: "file:///Volumes/G-DRIVE%20mobile%20USB-C/2019/iSchool/Images/Radioactivity%20Script.html"),
    DImage(Image: "newton", Difficulty: "Fortgeschritten", documentName: "Reibungskraft",Url: "file:///Volumes/G-DRIVE%20mobile%20USB-C/2019/iSchool/Images/Radioactivity%20Script.html")
]


