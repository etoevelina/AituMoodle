//
//  StatisticsView.swift
//  AituMoodle
//
//  Created by Эвелина Пенькова on 30.11.2024.
//

import SwiftUI

struct RingChart: View {
    var percentage: Double
    var gradient: LinearGradient
    private let lineWidth: CGFloat = 20.0
    
    var body: some View {
        let formattedPercentage = String(format: "%.0f", percentage)
        
        return ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: lineWidth))
                .frame(width: 90, height: 90)
            
            Circle()
                .trim(from: 0, to: CGFloat(percentage / 100))
                .stroke(gradient, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .frame(width: 90, height: 90)
                .rotationEffect(Angle(degrees: -90))
            
            Text("\(formattedPercentage)%")
                .font(.system(size: 20))
                .fontWeight(.bold)
        }
    }
}
struct RingChartGrade: View {
    var percentage: Double
    var gradient: LinearGradient
    private let lineWidth: CGFloat = 25.0
    
    var body: some View {
        let formattedPercentage = String(format: "%.0f", percentage)
        
        return ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: lineWidth))
                .frame(width: 150, height: 150)
            
            Circle()
                .trim(from: 0, to: CGFloat(percentage / 100))
                .stroke(gradient, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: -90))
            
            Text("\(formattedPercentage)%")
                .font(.customFont(size: 40))
                .fontWeight(.bold)
        }
    }
}

struct StatisticsView: View {
    @StateObject var apiClient = ApiClient.shared
//    @State private var averageAttendance: Double = 0.0
    var body: some View {
        VStack {
            HStack {
                VStack {
                    RingChart(
                        percentage: apiClient.percentAtt,
                        gradient: LinearGradient(
                            gradient: Gradient(stops: [
                                Gradient.Stop(color: Color(red: 1, green: 1, blue: 0), location: 0),
                                Gradient.Stop(color: Color(red: 1, green: 0, blue: 0.58), location: 0.99),
                            ]),
                            startPoint: UnitPoint(x: 0.5, y: -0.14),
                            endPoint: UnitPoint(x: 0.5, y: 1.17)
                        )
                    )
                    
                    Text("attend")
                        .font(.customFont(size: 20))
                        .foregroundColor(Color("FontWithouDark"))
                        .padding()
                }
                
                Spacer().frame(width: 50)
                
                VStack {
                    RingChart(
                        percentage: apiClient.percentAtt,
                        gradient: LinearGradient(
                            stops: [
                            Gradient.Stop(color: Color(red: 0.2, green: 0.96, blue: 0.96), location: 0),
                            Gradient.Stop(color: Color(red: 0, green: 0.41, blue: 0.78), location: 1),
                            ],
                            startPoint: UnitPoint(x: 0.14, y: 0),
                            endPoint: UnitPoint(x: 0.94, y: 1.13)
                            )
                    )
                    
                    Text("GPA")
                        .font(.customFont(size: 20))
                        .foregroundColor(Color("FontWithouDark"))
                        .padding()
                }.padding(.trailing)
            }.padding(.top)
            
        }


    }
    
}

#Preview {
    StatisticsView()
}
