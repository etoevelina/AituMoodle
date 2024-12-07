//
//  SubCardView.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 17.11.2024.
//

import SwiftUI

struct SubCardView: View {

    
    let gradients = [
        LinearGradient(
            gradient: Gradient(stops: [
                Gradient.Stop(color: Color(red: 0.47, green: 0.5, blue: 1), location: 0),
                Gradient.Stop(color: Color(red: 0.17, green: 0.18, blue: 0.32), location: 1)
            ]),
            startPoint: .top,
            endPoint: .bottom
        ),
        LinearGradient(
            gradient: Gradient(stops: [
                Gradient.Stop(color: Color(red: 0.91, green: 0.47, blue: 1), location: 0),
                Gradient.Stop(color: Color(red: 0.17, green: 0.18, blue: 0.32), location: 1)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
    ]
    
    @State private var currentIndex = 0
//    @State private var courses = [Course(id: 0, fullname: "-", completed: nil)]
//    @State private var dataAboutCourse = [(String, String)]()
    @StateObject var apiClient = ApiClient.shared
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<(apiClient.courses?.count ?? 0), id: \.self) { index in
                ZStack {
                    VStack {
                        HStack{
                            Text("📍")
                                .font(.system(size: 35))
                            if index < apiClient.courses?.count ?? 0 {
                                Text(apiClient.courses?[index].name ?? "-")
                                    .font(.customFont(size: 30))
                                    .foregroundColor(.white)
                            }
                        }.padding(.bottom, 30)

                        VStack {
                            if index < apiClient.courses?.count ?? 0 {
                                Text("\(NSLocalizedString("teacher", comment: "")) \(apiClient.courses?[index].teacher ?? "-")")
                                    .font(.customFont(size: 23))
                                    .foregroundColor(Color(red: 0.22, green: 0.19, blue: 0.15))
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.leading)
                                    .padding(10)
                            }
                        }
                        .foregroundColor(.clear)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.91, green: 0.87, blue: 0.28))
                        .cornerRadius(12)
                        .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.25), radius: 2, x: 1, y: 6)
                        .padding(.horizontal)
                        
                        VStack{
                            NavigationLink {
                                if let deadlines = apiClient.courses?[index].deadlines, !deadlines.isEmpty {
                                    DeadlinesView(deadlines: deadlines)
                                } else {
                                    NoDeadlinesView()
                                }
                                } label: {
                                Text("Deadlines")
                                    .font(.customFont(size: 23))
                                    .foregroundColor(Color("fontColor"))
                                    .frame(maxWidth: .infinity, maxHeight: 66)
                                    .background(Color(red: 0.95, green: 0.95, blue: 0.95)).opacity(0.8)
                                    .cornerRadius(12)
                                    .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.25), radius: 2, x: 1, y: 6)
                                    .padding(.horizontal)
                            }
                            
                            
                            NavigationLink {
                                GradesView(gradesItem: apiClient.courses?[index].grades)
                            } label: {
                                Text("Grades")
                                    .font(.customFont(size: 23))
                                    .foregroundColor(Color("fontColor"))
                                    .frame(maxWidth: .infinity, maxHeight: 66)
                                    .background(Color(red: 0.95, green: 0.95, blue: 0.95)).opacity(0.8)
                                    .cornerRadius(12)
                                    .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.25), radius: 2, x: 1, y: 6)
                                    .padding(.horizontal)
                            }
                            
                        }
                    }
                    .frame(width: 314, height: 400)
                    .background(gradients[index % gradients.count])
                    .cornerRadius(31)
                    .shadow(color: Color.black.opacity(0.25), radius: 2, x: 1, y: 6)
                    //.padding(.top)
                    .padding(.bottom, 20)
                }
                .tag(index)
            }
        }
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

            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
    
//    private func indexingGrades(courses: [Course], grades: [])
}

#Preview {
//    MainView()
}
