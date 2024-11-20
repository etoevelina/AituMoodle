//
//  SubCardView.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 17.11.2024.
//

import SwiftUI

struct SubCardView: View {
    let subjects = [
        Subject (name: "Linear Algebra 1", teacher: "Aynur Bakeniva", deadlines: [
            Deadline(date: Date(), name: "Homework 1"),
            Deadline(date: Date().addingTimeInterval(604800), name: "Project 1")
        ], lastMark: 90, attendance: 100),
        
        Subject (name: "Introducing to programming 1", teacher: "Assel Bakeniva", deadlines: [
            Deadline(date: Date(), name: "Homework 1"),
            Deadline(date: Date().addingTimeInterval(604800), name: "Project 1")
        ], lastMark: 90, attendance: 100)
    ]
    
    
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
    
    var body: some View {
    TabView(selection: $currentIndex) {
               ForEach(0..<subjects.count, id: \.self) { index in
                   ZStack {
                       VStack {
                           HStack{
                               Text("📍")
                                   .font(.system(size: 35))
                               Text(subjects[index].name)
                                   .font(.customFont(size: 33))
                                   .foregroundColor(.white)
                           }
                           .frame(width: 314)
                           VStack{
                              
                                   
                                   Text("Teacher: \(subjects[index].teacher)")
                                       .font(.customFont(size: 23))
                                       .foregroundColor(Color(red: 0.22, green: 0.19, blue: 0.15))
                               
                           }
                           .foregroundColor(.clear)
                           .frame(width: 297, height: 42)
                           .background(Color(red: 0.91, green: 0.87, blue: 0.28))
                           .cornerRadius(31)
                           .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.25), radius: 2, x: 1, y: 6)
                           
                           HStack{
                               VStack (alignment: .leading, spacing: 5) {
                                       Text("Deadlines")
                                       .font(.customFont(size: 23))
                                       .foregroundColor(Color(red: 0.22, green: 0.19, blue: 0.15))
                                       .padding(.top)
                                       ForEach(subjects[index].deadlines) { deadline in
                                           Text("• \(deadline.name) on \(deadline.date, formatter: dateFormatter)")
                                               .font(.customFont(size: 20))
                                               .foregroundColor(Color(red: 0.22, green: 0.19, blue: 0.15))
                                       }
                                    
                                   Spacer()
                                   }
                                   .foregroundColor(.clear)
                                   .frame(width: 147, height: 257)
                                   .background(Color(red: 0.59, green: 0.99, blue: 1))
                                   .cornerRadius(12)
                                   .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.25), radius: 2, x: 1, y: 6)
                               
                               VStack{
                                   VStack{
                                       Text("Last Mark")
                                           .font(.customFont(size: 23))
                                           .foregroundColor(Color(red: 0.22, green: 0.19, blue: 0.15))
                                           .multilineTextAlignment(.leading)
                                       Text("\(subjects[index].lastMark)")
                                           .font(.customFont(size: 85))
                                           .foregroundColor(Color(red: 0.1, green: 0.13, blue: 0.53))
                                           .multilineTextAlignment(.center)
                                       
                                   }.foregroundColor(.clear)
                                       .frame(width: 139, height: 142)
                                       .background(Color(red: 0.57, green: 1, blue: 0.84))
                                       .cornerRadius(12)
                                       .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.25), radius: 2, x: 1, y: 6)
                                   
                                   VStack{
                                       Text("Attendance")
                                           .font(.customFont(size: 23))
                                           .foregroundColor(Color(red: 0.22, green: 0.19, blue: 0.15))
                                           .multilineTextAlignment(.leading)
                                       Text("\(subjects[index].attendance)")
                                           .font(.customFont(size: 52))
                                           .foregroundColor(Color(red: 0.1, green: 0.13, blue: 0.53))
                                           .multilineTextAlignment(.center)
                                       
                                   }.foregroundColor(.clear)
                                       .frame(width: 139, height: 103)
                                       .background(Color(red: 0.91, green: 0.63, blue: 1))
                                       .cornerRadius(12)
                                       .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.25), radius: 2, x: 1, y: 6)
                               }
                               
                               
                           }
                           
                        
                           
                       }
                       .padding()
                       .frame(width: 314, height: 435)
                       .background(gradients[index % gradients.count])
                       .cornerRadius(31)
                       .shadow(color: Color.black.opacity(0.25), radius: 2, x: 1, y: 6)
                       .padding(.top)
                       .padding(.bottom, 70)
                   }
                   .tag(index)
               }
           }
    .tabViewStyle(PageTabViewStyle())
    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
       }
}

#Preview {
    SubCardView()
}
