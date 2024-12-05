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

    var body: some Scene {
        let defaults = UserDefaults.standard.value(forKey: "login")
        WindowGroup {
            if (defaults != nil) == true {
                MainView()
                    .onAppear {
                        Task {
                            do {
                                try await apiClient.fetchUser(token: "6f9484c897509fa5b7f541ff879f945f")
                                print("User fetched successfully")
                            } catch let error as NetworkError {
                                switch error {
                                case .noData:
                                    print("No data received")
                                case .notFound:
                                    print("User not found")
                                case .decodingError:
                                    print("Error decoding user data")
                                }
                            } catch {
                                print("Unexpected error: \(error)")
                            }
                            
                            
                            do {
                                try await apiClient.fetchCourses(token: "6f9484c897509fa5b7f541ff879f945f")
                            } catch let error as NetworkError {
                                switch error {
                                case .noData:
                                    print("No data received")
                                case .notFound:
                                    print("Courses not found")
                                case .decodingError:
                                    print("Error decoding courses data")
                                }
                            } catch {
                                print("Unexpected error: \(error)")
                            }
                            
                            do {
                                try await apiClient.fetchGrades(token: "6f9484c897509fa5b7f541ff879f945f")
                            } catch let error as NetworkError {
                                switch error {
                                case .noData:
                                    print("No data received")
                                case .notFound:
                                    print("Grades not found")
                                case .decodingError:
                                    print("Error decoding grades data")
                                }
                            } catch {
                                print("Unexpected error: \(error)")
                            }
                            
                            do {
                                try await apiClient.fetchDeadlines(token: "6f9484c897509fa5b7f541ff879f945f")
                            } catch let error as NetworkError {
                                switch error {
                                case .noData:
                                    print("No data received")
                                case .notFound:
                                    print("Deadlines not found")
                                case .decodingError:
                                    print("Error decoding deadlines data")
                                }
                            } catch {
                                print("Unexpected error: \(error)")
                            }
                        }
                    }
            } else {
                AuthView()
            }
        }
    }
}
