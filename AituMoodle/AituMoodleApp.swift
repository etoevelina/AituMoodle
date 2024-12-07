//
//  AituMoodleApp.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 17.11.2024.
//

import SwiftUI

@main
struct AituMoodleApp: App {
    @StateObject var apiClient = ApiClient.shared
    @StateObject var notificationManager = NotificationManager()

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let defaults = UserDefaults.standard.value(forKey: "login")

    var body: some Scene {
        WindowGroup {
            if (defaults != nil) == true {
                MainView()
                    .onAppear {
                        
                        Task {

                            do {
                                try await apiClient.fetchUser(token: "6f9484c897509fa5b7f541ff879f945f")
                                print("User fetched successfully")
                            } catch let error as NetworkError {
                                print(error)
                            } catch {
                                print("Unexpected error: \(error)")
                            }
                            
                            
                            do {
                                try await apiClient.fetchCourses(token: "6f9484c897509fa5b7f541ff879f945f")
                            } catch let error as NetworkError {
                                print(error)

                            } catch {
                                print("Unexpected error: \(error)")
                            }
                            
                            do {
                                try await apiClient.fetchGrades(token: "6f9484c897509fa5b7f541ff879f945f")
                            } catch let error as NetworkError {
                                print(error)

                            } catch {
                                print("Unexpected error: \(error)")
                            }
                            
                            do {
                                try await apiClient.fetchDeadlines(token: "6f9484c897509fa5b7f541ff879f945f")
                            } catch let error as NetworkError {
                                print(error)

                            } catch {
                                print("Unexpected error: \(error)")
                            }
                        }

                    }
            } else {
                AuthView()
                    .onAppear {
                        Task {
                            await notificationManager.request()
                            await notificationManager.getAuthStatus()

                        }
                    }
                    
            }
        }
    }
}
