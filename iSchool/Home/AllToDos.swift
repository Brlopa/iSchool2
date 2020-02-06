//
//  AllToDos.swift
//  iSchool
//
//  Created by Bruno on 28.09.19.
//  Copyright © 2019 Thomas. All rights reserved.
//

import SwiftUI

struct AllToDos: View {
    
    let OffsetNumber = CGFloat(30)
    
    var LessonsName = ["Deutsch", "Englisch", "Chemie"]
    
    
    fileprivate func BlackRectangle() -> some View {
        return Rectangle()
            .foregroundColor(Color("backgroundBlack"))
            .frame(width: scaledToFit() as? CGFloat, height: 900)
    }
    
    fileprivate func TopicRectangle() -> some View {
        return Rectangle()
            .cornerRadius(10)
            .frame(width: scaledToFit() as? CGFloat, height: 48)
            //.accentColor(.white)
            // .padding(.top, 18)
            .foregroundColor(Color("backgrpundWhite"))
            .padding(.leading, 16)
    }
    
    fileprivate func CircleDown() -> some View {
        return Image(systemName: "chevron.down.circle.fill")
            .imageScale(.large)
            .foregroundColor(Color.blue)
            //.padding(.trailing)
            .frame(width: 15, height: 15)
            //.frame(width: scaledToFit() as? CGFloat)
            .padding(.trailing)
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                ZStack(alignment: .topLeading){
                    BlackRectangle()
                    VStack(alignment: .leading){
                        Text("ToDos")
                            .font(.system(size: 33))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(.white))
                            //.padding(.leading)
                            .offset(y: OffsetNumber)
                            .padding(.leading)
                        //.padding(.top, 75)
                        
                        VStack(spacing: 10){
                            ZStack(alignment: .leading){
                                TopicRectangle()
                                //.shadow(color: Color("white"), radius: 5)
                                HStack{
                                    Text(LessonsName[0])
                                        .font(.system(size: 17))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color("black"))
                                        //.padding(.top, 16)
                                        .padding(.leading, 38)
                                    
                                    Spacer()
                                    
                                    CircleDown()
                                }
                                
                            }
                            
                            //Deutsch
                            ZStack(alignment: .leading){
                                TopicRectangle()
                                //.shadow(color: Color("white"), radius: 5)
                                
                                HStack{
                                    Text(LessonsName[1])
                                        .font(.system(size: 17))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color("black"))
                                        //.padding(.top, 16)
                                        .padding(.leading, 38)
                                    
                                    Spacer()
                                    
                                    CircleDown()
                                    
                                }
                            }
                            //Franösisch
                            ZStack(alignment: .leading){
                                TopicRectangle()
                                //.shadow(color: Color("white"), radius: 5)
                                HStack{
                                    Text(LessonsName[2])
                                        .font(.system(size: 17))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color("black"))
                                        //.padding(.top, 16)
                                        .padding(.leading, 38)
                                    
                                    Spacer()
                                    
                                    CircleDown()
                                }
                            }
                            //Chemie
                        }.padding(.trailing)
                         .offset(y: OffsetNumber)
                            //.padding(.top, 5)
                    }.padding(.top, 120)
                    .frame(height: scaledToFit() as? CGFloat)
                   
                }
            }
        }
    }
}
struct AllToDos_Previews: PreviewProvider {
    static var previews: some View {
        AllToDos()
    }
}
