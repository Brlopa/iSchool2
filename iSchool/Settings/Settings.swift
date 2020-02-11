//
//  Settings.swift
//  iSchool
//
//  Created by Bruno on 03.02.20.
//  Copyright © 2020 Thomas. All rights reserved.
//

import SwiftUI
import WebKit
import AuthenticationServices
import UserNotifications



let SettingsData = [
    SettingsDat(image : "questionmark",content: "Hilfe / FAQ", destination: "HTMLViewer()"),
    SettingsDat(image : "radiowaves.right",content: "Social Media", destination: "HTMLViewer()"),
    SettingsDat(image : "quote.bubble",content: "Kontakt", destination: "HTMLViewer()")
]



struct Settings: View {
    @State var showShareSheet = false
    @State var name: String = "John"
    @State var isShowing = true // toggle state
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Text(" ")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(Color("gray-1"))
                        .edgesIgnoringSafeArea(.top)
                    VStack{
                        HStack(alignment: .top){
                            Image("IMG_0479")
                                .resizable()
                                .frame(width: 88, height: 88)
//                                .padding(.leading,16)
                                .cornerRadius(18)
                            Spacer()
                            VStack(alignment: .leading){
                                Text("Bruno Weidner")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text("iSchool Designer & Entwickler")
                                    .font(.custom("SF Pro Text", size: 15))
                                    .padding(.top,3)
                                //                                Text("enjoy school!")
                                //                                    .font(.title)
                                //                                    .bold()
                                //                                    .italic()
                                //                                    .padding(.top,8)
                            }.padding(.trailing,54)
                        }.navigationBarTitle(Text("Einstellungen")).padding(.leading,16)
                        Button(
                            action: {
                                self.showShareSheet = true
                        },
                            label: {
                                VStack{
                                    HStack{
                                        Image(systemName: "person.3.fill")
                                            .foregroundColor(.white)
                                        Text("iSchool empfehlen")
                                            .foregroundColor(.white)
                                        Spacer()
                                    }.padding(.leading,16).padding(.top,15).padding(.bottom,15)
                                }
                                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                                .frame(width: 340)
                                
                        }
                        ).cornerRadius(13)
                            .padding(.top)
                            .sheet(isPresented: $showShareSheet) {
                                ShareApp(activityItems: ["Hey, ich habe diese tolle App gefunden. Die musst du dir umbedingt anchauen!\n"+"apple.com"])
                        }
                        List(SettingsData) { item in
                            NavigationLink(destination: HTMLViewer()) {
                                HStack{
                                    Image(systemName: item.image)
                                        .foregroundColor(.blue)
                                    Text(item.content)
                                }
                            }
                        }.listStyle(GroupedListStyle())
                        Spacer()
                        
                        //                        TextField("Name's placeholder", text: $name)
                        //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        //                        .padding()
                        
//                        VStack {
//
//                            Button("Request Permission") {
//                                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                                    if success {
//                                        print("All set!")
//                                    } else if let error = error {
//                                        print(error.localizedDescription)
//                                    }
//                                }
//                            }
//
//                            Button("Schedule Notification") {
//                                let content = UNMutableNotificationContent()
//                                content.title = "Feed the cat"
//                                content.subtitle = "It looks hungry"
//                                content.sound = UNNotificationSound.default
//
//                                // show this notification five seconds from now
//                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//                                // choose a random identifier
//                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//                                // add our notification request
//                                UNUserNotificationCenter.current().add(request)
//                            }
//                        }
                        
                    }.padding(.top, 28.0)
                    
                }
            }
        }
    }
}

final class SignInWithApple: UIViewRepresentable {
    // 2
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        // 3
        return ASAuthorizationAppleIDButton()
    }
    // 4
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

struct SettingsDat: Identifiable {
    var id = UUID()
    var image: String
    var content: String
    var destination: String
    
}
