//
//  ContentView.swift
//  iSchool
//
//  Created by Bruno on 25.09.19.
//  Copyright © 2019 Bruno. All rights reserved.
//

import SwiftUI
import PDFKit
import Combine

struct MockCourse {
    let name: String
    let tasks: [String]
}

struct Home: View {
    var LessonsName = Model.currentModel.courses
    //    ändern um auf iCloud Daten zuzugraifen
    //    var LessonsName = [
    //        MockCourse(name: "Biologie", tasks: ["test", "test2", "test3"]),
    //        MockCourse(name: "English", tasks: ["test", "test2", "test3"]),
    //        MockCourse(name: "French", tasks: ["test", "test2", "test3"])
    //    ]
    var TaskDataCloud = Model.currentModel.courses
    let BlurCount = CGFloat(10)
    @State var showContent = false
    @State var show = false
    @State var showEN = false
    @State var showCH = false
    var Task = TaskData
    var Task2 = TaskData2
    
    fileprivate func ShowMore() -> some View {
        return //Chemie
            
            Text("Show more...")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color(.black))
                .padding(.leading)
                .padding(.top, 15)
    }
    fileprivate func DetailRectangle() -> some View {
        return Rectangle()
            //.position(x: 0, y: show ? 0 : 20)
            .cornerRadius(10)
            .frame(width: scaledToFit() as? CGFloat, height: 150)
            //.accentColor(.white)
            // .padding(.top, 18)
            //.foregroundColor(Color("backgrpundWhite"))
            .padding(.leading, 16)
    }
    fileprivate func BlackRectangle() -> some View {
        return Rectangle()
            .foregroundColor(Color("backgroundBlack"))
            .navigationBarTitle(Text("Home"))
            //            .padding(.top, 5)
            .frame(height: 300)
        
    }
    fileprivate func TopicRectangle() -> some View {
        return Rectangle()
            .cornerRadius(10)
            .frame(width: scaledToFit() as? CGFloat, height: 48)
            //.accentColor(.white)
            // .padding(.top, 18)
            //.foregroundColor(Color("backgrpundWhite"))
            .padding(.leading, 16)
    }
    fileprivate func CircleDown() -> some View {
        return Image(systemName: "chevron.down.circle.fill")
            .imageScale(.large)
            //.foregroundColor(Color.blue)
            //.padding(.trailing)
            .frame(width: 32, height: 32)
            //.frame(width: scaledToFit() as? CGFloat)
            .padding(.trailing)
        
    }
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                //            Text(TaskDataCloud.tasks)
                VStack{
                    CurrentDate()
                        .padding(.top,16)
                    ZStack{
                        VStack{
                            ZStack(alignment: .topLeading){
                                BlackRectangle()
                                HStack{
                                    Image(systemName: "sun.min.fill")
                                        .imageScale(.large)
                                        .foregroundColor(.white)
                                        //.padding(.trailing)
                                        .frame(width: 15, height: 15)
                                        //.frame(width: scaledToFit() as? CGFloat)
                                        .padding(.leading, 15)
                                        .padding(.top, 16)
                                    
                                    Text("ToDay")
                                        .font(.system(size: 33))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.top, 16)
                                }
                                
                                VStack//(alignment: .center, spacing: 10)
                                    {
                                        ZStack{
                                            ZStack(alignment: .leading){
                                                
                                                ZStack(alignment: .leading){
                                                    
                                                    DetailRectangle()
                                                        //.position(x: 170 , y: 20)
                                                        .offset(y: showEN ? 50 : 0)
                                                        .animation(.default)
                                                        .opacity(showEN ? 1 : 0)
                                                        .foregroundColor(Color(showEN ? "backgrpundWhite" : "backgroundBlack"))
                                                        .scaleEffect(0.95)
                                                    
                                                    VStack(spacing: 10){
                                                        
                                                        ForEach(Task) { item in
                                                            Text(verbatim: item.text)
                                                                .font(.system(size: 14))
                                                                .fontWeight(.regular)
                                                                .foregroundColor(Color("black"))
                                                                //.padding(.top, 16)
                                                                //.padding(.leading, 16)
                                                                //.padding(.top, 80)
                                                                .opacity(self.show ? 1 : 0)
                                                        }
                                                    } .offset(y: showEN ? 65 : 0)
                                                    //.animation(.default)
                                                    //.padding(.top, 50)
                                                    //.padding(.leading, 18)
                                                }
                                                
                                                TopicRectangle()
                                                    .foregroundColor(Color(showEN ? "purple" : "backgrpundWhite" ))
                                                
                                                //.shadow(color: Color("white"), radius: 5)
                                                
                                                HStack{
                                                    Text(LessonsName[1].name)
                                                        .font(.system(size: 17))
                                                        .fontWeight(.regular)
                                                        .foregroundColor(Color("black"))
                                                        //.padding(.top, 16)
                                                        .padding(.leading, 38)
                                                    
                                                    
                                                    Spacer()
                                                    
                                                    CircleDown()
                                                        .foregroundColor(Color.purple)
                                                        .opacity(showEN ? 0 : 1)
                                                    
                                                    
                                                }
                                            }
                                            .onTapGesture {
                                                self.showEN.toggle()
                                            }
                                            .scaleEffect(showEN ? 1.06 : 1)
                                            .blur(radius: show ? BlurCount : 0)
                                            .animation(showEN ? .interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10, initialVelocity: 20): .none)
                                                .offset(y: 80) //Anpassen wenn grösse Rectangle() anpassen
                                            //Englisch
                                            ZStack(alignment: .leading){
                                                
                                                ZStack(alignment: .leading){
                                                    
                                                    DetailRectangle()
                                                        //.position(x: 170 , y: 20)
                                                        .offset(y: showCH ? 50 : 0)
                                                        .animation(.default)
                                                        .opacity(showCH ? 1 : 0)
                                                        .foregroundColor(Color(showCH ? "backgrpundWhite" : "backgroundBlack"))
                                                        .scaleEffect(0.95)
                                                    
                                                    VStack(spacing: 10){
                                                        
                                                        
                                                        
                                                        ForEach(Task) { item in
                                                            Text(verbatim: item.text)
                                                                .font(.system(size: 14))
                                                                .fontWeight(.regular)
                                                                .foregroundColor(Color("black"))
                                                                //.padding(.top, 16)
                                                                //.padding(.leading, 16)
                                                                //.padding(.top, 80)
                                                                .opacity(self.show ? 1 : 0)
                                                        }
                                                        
                                                        
                                                        
                                                    } .offset(y: showCH ? 65 : 0)
                                                    //.animation(.default)
                                                    //.padding(.top, 50)
                                                    //.padding(.leading, 18)
                                                }
                                                
                                                TopicRectangle()
                                                    .foregroundColor(Color(showCH ? "pink" : "backgrpundWhite"))
                                                
                                                HStack{
                                                    Text(LessonsName[2].name)
                                                        .font(.system(size: 17))
                                                        .fontWeight(.regular)
                                                        .foregroundColor(Color(showCH ? "backgrpundWhite" : "black"))
                                                        //.padding(.top, 16)
                                                        .padding(.leading, 38)
                                                    
                                                    Spacer()
                                                    
                                                    CircleDown()
                                                        .foregroundColor(Color(showCH ? "backgrpundWhite" : "pink"))
                                                        .animation(show ? .interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10, initialVelocity: 20): .none)
                                                }
                                            }
                                            .onTapGesture {
                                                self.showCH.toggle()
                                            }
                                            .scaleEffect(showCH ? 1.06 : 1)
                                            .animation(showCH ? .interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10, initialVelocity: 20): .none)
                                            .blur(radius: show ? BlurCount : 0)
                                                // .blur(radius: showEN ? BlurCount : 0)
                                                .offset(y: 20)
                                            //Chemie
                                            ZStack(alignment: .leading){
                                                ZStack(alignment: .leading){
                                                    DetailRectangle()
                                                        //.position(x: 170 , y: 20)
                                                        .offset(x: 0 , y: show ? 65 : 15)
                                                        .animation(.default)
                                                        .opacity(show ? 1 : 0)
                                                        .foregroundColor(Color("backgrpundWhite"))
                                                        .scaleEffect(0.95)
                                                    
                                                    VStack(alignment: .leading, spacing: 10){
                                                        
                                                        ForEach(Task) { item in
                                                            HStack{
                                                                Text(verbatim: item.text)
                                                                    .font(.system(size: 14))
                                                                    .fontWeight(.regular)
                                                                    .foregroundColor(Color("black"))
                                                                    .padding(.leading, 35)
                                                                //.padding(.top, 80)
                                                                
                                                                Spacer()
                                                                
                                                                Image("arrow.right")
                                                                    //.imageScale(.medium)
                                                                    //.foregroundColor(Color.blue)
                                                                    //.padding(.trailing)
                                                                    .frame(width: 10, height: 10)
                                                                //.frame(width: scaledToFit() as? CGFloat)
                                                                //.padding(.leading)
                                                            }
                                                        }
                                                    } .offset(y: show ? 65 : 0)
                                                        .padding(.top)
                                                        .animation(.default)
                                                        .opacity(self.show ? 1 : 0)
                                                    //.padding(.top, 50)
                                                    //.padding(.leading, 18)
                                                }
                                                TopicRectangle()
                                                    .foregroundColor(Color(show ? "blue" : "backgrpundWhite"))
                                                //.shadow(color: Color("white"), radius: 5)
                                                HStack{
                                                    Text(LessonsName[0].name)
                                                        .font(.system(size: 17))
                                                        .fontWeight(.regular)
                                                        .foregroundColor(Color(show ? "backgrpundWhite" : "black"))
                                                        //.padding(.top, 16)
                                                        .padding(.leading, 38)
                                                    
                                                    Spacer()
                                                    
                                                    CircleDown()
                                                        .foregroundColor(Color(show ? "backgrpundWhite" : "blue"))
                                                        .animation(.default)
                                                    
                                                }
                                                
                                            }
                                            .onTapGesture {
                                                self.show.toggle()
                                                self.showCH = false
                                            }
                                                //Animationsbefehl
                                                .scaleEffect(show ? 1.06 : 1)
                                                .animation(show ? .interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10, initialVelocity: 20): .none)
                                                .offset(y: -40)
                                            // .blur(radius: showEN ? BlurCount : 0)
                                            //Deutsch
                                            
                                        }
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                }
                                .padding(.top, 55)
                                .padding(.trailing)
                            }
                            //Haupt
                            VStack{
                                Text("Vielen Dank dass Sie iSchool verwenden, auf dieser Seite findest du die wichtigsten Infomation zu deinem Schultag")
                                    .lineLimit(10)
                                    .padding(.leading)
                                    //.padding(.trailing)
                                    .frame(width: scaledToFit() as? CGFloat)
                                    .padding(.top, 10)
                                    .blur(radius: showEN ? BlurCount : 0)
                                    .animation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10, initialVelocity: 20))
                                
                                ShowMore()
                                    //.offset(y: -50)
                                    .opacity(showEN ? 0 : 1)
                                    .blur(radius: show ? BlurCount  : 0)
                                    .blur(radius: showEN ? BlurCount : 0)
                                    // .animation(.default)
                                    .onTapGesture {
                                        self.showContent.toggle()
                                }
                                .sheet(isPresented: self.$showContent) { AllToDos()
                                }
                            }//.padding(.bottom, 10)
                            //Text
                        }.padding(.top)
                    }
                }
                //            .frame(width: scaledToFit() as? CGFloat, height: scaledToFit() as? CGFloat)
            }
        }
    }
}





















struct Task : Identifiable {
    var id = UUID()
    var text: String
    
}

struct Task2 : Identifiable{
    var id = UUID()
    var text: String
}
//
let TaskData = [
    //Task(text: "Billing"),
    Task(text: "Terror lesen"),
    Task(text: "ja moin, bitte nicht lesen"),
    Task(text: "Terror lesen")
    
]

let TaskData2 = [
    //Task(text: "Billing"),
    Task(text: "Terror lesen"),
    Task(text: "ja moin, bitte nicht lesen"),
    Task(text: "Terror lesen")
    
]
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif


