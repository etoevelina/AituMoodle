//
//  UserView.swift
//  AituMoodle
//
//  Created by Эвелина Пенькова on 30.11.2024.
//
import SwiftUI
import UserNotifications
@testable import SettingsIconGenerator

struct UserView: View {
    @State private var notificationsEnabled: Bool = false
    @State private var selectedOption: String = "None"
    @State private var showAlert: Bool = false
    @StateObject var apiClient = ApiClient.shared


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
            
            
            VStack{
                Text(apiClient.user?.fullname ?? "-")
                    .font(.customFont(size: 40))
                
                Text(apiClient.user?.username ?? "-")
                    .font(.customFont(size: 25))
                
                Spacer()
            }.foregroundColor(Color("FontWithouDark"))
                .padding(.top)
            
            VStack {
                Spacer().frame(height: 130)
                VStack {
                    VStack{
                            HStack{
                                Text("statistics")
                                    .font(.customFont(size: 35))
                                    .foregroundColor(Color("FontWithouDark"))
                                Spacer()
                            }
                            .padding(.leading,30)
                            
                            StatisticsView()
                            
                            VStack {
                                HStack{
                                    Text("settings")
                                        .font(.customFont(size: 35))
                                        .foregroundColor(Color("FontWithouDark"))
                                    Spacer()
                                }
                                .padding(.leading,30)
                                
                                VStack {
                                    Button{
                                        openSettings()
                                    } label: {
                                        HStack{
                                            SettingsIcon(systemName: "textformat.characters", backgroundColor: .yellow)
                                                .padding(.leading)
                                            Text("language")
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
                                            SettingsIcon(systemName: "bell", backgroundColor: .cyan)
                                                .padding(.leading)
                                            Text("notif")
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
                                            SettingsIcon(systemName: "graduationcap", backgroundColor: .green)
                                                .padding(.leading)
                                            Text("howToUse")
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
                                            Text("signOut")
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
                            
                            
                        Spacer()
                            
                        }
                    }
                    .padding(.top, 50)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 0.91, green: 0.91, blue: 1))
                    .clipShape(RoundedCornerShape(radius: 115, corners: [.topLeft]))
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        .onAppear {
            Task {
                do {
                    try await apiClient.fetchUser(token: "6f9484c897509fa5b7f541ff879f945f")
                } catch let error as NetworkError {
                    print(error)

                } catch {
                    print("Unexpected error: \(error)")
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("NotificationsDisabled"),
                message: Text("PleaseNotifications"),
                dismissButton: .default(Text("OK"))
            )
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
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    print("Permission granted")
                } else {
                    showAlert = true
                    notificationsEnabled = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}

