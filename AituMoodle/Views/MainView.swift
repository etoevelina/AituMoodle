//
//  MainView.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 20.11.2024.
//

import SwiftUI

struct MainView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @StateObject var apiClient = ApiClient.shared

    
    var body: some View {
        NavigationView{
            ZStack{
                Group{
                    switch selectedTab {
                    case .bell:
                        NotificationsView()
                    case .home:
                        HomeView()
                    case .user:
                        UserView()
                    }
                }
                TapBarView()
            }.transition(.opacity)
            .animation(.easeInOut, value: selectedTab)
            .onAppear {
                Task {
                    
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
                    withAnimation {
                        fetchAndCalculateAverageAttendance()
                    }
                }
               
            }
        }
    }
    func fetchAndCalculateAverageAttendance()  {
        guard let courses = apiClient.courses else { return }
        var totalAttendance = 0
        var count = 0
        
        for course in courses {
            if let grades = course.grades {
                for grade in grades {
                    if grade.itemname.contains("Attendance") {
                            let percentageString = grade.percentageformatted.split(separator: ".").first ?? "0"
                            if let attendance = Int(percentageString) {
                                totalAttendance += attendance
                                count += 1
                            }
                        
                    }
                }
            }
        }
        print(totalAttendance)
        print(count)
        
        apiClient.percentAtt = count > 0 ? Double(totalAttendance) / Double(count) : 0.0
    }
    
    func fetchAndCalculateAverageGpa()  {
        guard let courses = apiClient.courses else { return }
        var totalMark = 0
        var count = 0
        
        for course in courses {
            if let grades = course.grades {
                for grade in grades {
                    if grade.itemname.contains("Register Term") {
                            let percentageString = grade.percentageformatted.split(separator: ".").first ?? "0"
                            if let mark = Int(percentageString) {
                                totalMark += mark
                                count += 1
                            }
                        
                    }
                }
            }
        }
        print(totalMark)
        print(count)
        
        apiClient.percentGpa = count > 0 ? Double(totalMark) / Double(count) : 0.0
    }
}

#Preview {
    MainView()
}
