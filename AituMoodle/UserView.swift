//
//  UserView.swift
//  AituMoodle
//
//  Created by Эвелина Пенькова on 30.11.2024.
//
import SwiftUI
@testable import SettingsIconGenerator

struct UserView: View {
        @State private var notificationsEnabled: Bool = false
        @State private var selectedOption: String = "None"

    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: Color(red: 0.94, green: 1, blue: 1), location: 0.01),
                    Gradient.Stop(color: Color(red: 0.12, green: 0.36, blue: 0.65), location: 1),
                ]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer().frame(height: 150)
                VStack {
                    VStack{
                        ScrollView {
                            HStack{
                                Text("Statistics")
                                    .font(.customFont(size: 43))
                                    .foregroundColor(Color("FontWithouDark"))
                                Spacer()
                            }
                            .padding(.leading,30)
                            
                            StatisticsView()
                            
                            
                            VStack {
                                HStack{
                                    Text("Settings")
                                        .font(.customFont(size: 43))
                                        .foregroundColor(Color("FontWithouDark"))
                                    Spacer()
                                }
                                .padding(.leading,30)
                                
                                Button{
                                    openSettings()
                                } label: {
                                    HStack{
                                        SettingsIcon(systemName: "chart.line.uptrend.xyaxis", backgroundColor: .yellow)
                                            .padding(.leading)
                                        Text("Language")
                                            .font(.customFont(size: 20))
                                            .foregroundColor(Color.blue)
                                        Spacer()
                                        Image(systemName: "greaterthan")
                                            .padding(.trailing)
                                    }.frame(maxWidth: .infinity, minHeight: 50)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal, 20)
                                }
                                
                                NotificationSettingsView()
                                
                                Button{
                                    openSettings()
                                } label: {
                                    HStack{
                                        SettingsIcon(systemName: "graduationcap", backgroundColor: .green)
                                            .padding(.leading)
                                        Text("How to use it?")
                                            .font(.customFont(size: 20))
                                            .foregroundColor(Color.blue)
                                        Spacer()
                                        
                                    }.frame(maxWidth: .infinity, minHeight: 50)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal, 20)
                                }
                                
                                Button{
                                    openSettings()
                                } label: {
                                    HStack{
                                        SettingsIcon(systemName: "rectangle.portrait.and.arrow.forward", backgroundColor: .purple)
                                            .padding(.leading)
                                        Text("Sign Out")
                                            .font(.customFont(size: 20))
                                            .foregroundColor(Color.blue)
                                        Spacer()
                                        
                                    }.frame(maxWidth: .infinity, minHeight: 50)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal, 20)
                                }

                            }
                            
                            
                            
                            }
                        }
                    }
                    .padding(.top, 50)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 0.91, green: 0.91, blue: 1))
                    .clipShape(RoundedCornerShape(radius: 115, corners: [.topLeft]))
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
        
    func openSettings() {
                guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                if UIApplication.shared.canOpenURL(settingsURL) {
                    UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                }
            }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
struct NotificationSettingsView: View {
    @State private var notificationsEnabled: Bool = false
    @State private var selectedOption: String = "None"
    
    var body: some View {
        HStack {
            SettingsIcon(systemName: "bell", backgroundColor: .cyan)
                .padding(.leading)
            
            Toggle(isOn: $notificationsEnabled) {
                
               
                Text("Notifications")
                    .font(.customFont(size: 20))
                    .foregroundColor(Color.blue)
                
            }.padding(.trailing)
            
            
        }
        .frame(maxWidth: .infinity, minHeight: 50)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 20)
    }
}