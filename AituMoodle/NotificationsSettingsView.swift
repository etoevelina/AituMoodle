//
//  NotificationsSettingsView.swift
//  AituMoodle
//
//  Created by Эвелина Пенькова on 01.12.2024.
//

import SwiftUI
@testable import SettingsIconGenerator

struct NotificationSettingsView: View {
    @State private var notificationsEnabled: Bool = false
    @State private var showAlert: Bool = false
    
    var body: some View {
        HStack {
            SettingsIcon(systemName: "bell", backgroundColor: .cyan)
                .padding(.leading)
            
            Toggle(isOn: $notificationsEnabled) {
                Text("Notifications")
                    .font(.customFont(size: 20))
                    .foregroundColor(Color.blue)
            }
            .padding(.trailing)
            .onChange(of: notificationsEnabled) { value in
                if value {
                    requestNotificationPermission()
                }
            }
        }
        .frame(maxWidth: .infinity, minHeight: 50)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 20)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Notifications Disabled"),
                message: Text("Please enable notifications in Settings to receive alerts."),
                dismissButton: .default(Text("OK"))
            )
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

