//
//  DeadlinesView.swift
//  AituMoodle
//
//  Created by Алексей Азаренков on 03.12.2024.
//

import SwiftUI

struct GradesView: View {
    
    let gradesItem: [GradeItem]?
    let colors = [
        Color(red: 0.88, green: 1, blue: 0.7),
        Color(red: 1, green: 0.93, blue: 0.7),
        Color(red: 0.98, green: 0.77, blue: 0.99)
    ]
    
    var body: some View {
        ScrollView {
            if let firstGrade = gradesItem?.first(where: { $0.itemname == "Register Term" && $0.percentageformatted != "-" }) {
                VStack {
                    RingChart(
                        percentage: makeDouble(s: firstGrade.percentageformatted ?? "-"),
                        gradient: LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.2, green: 0.96, blue: 0.96), location: 0),
                                Gradient.Stop(color: Color(red: 0, green: 0.41, blue: 0.78), location: 1),
                            ],
                            startPoint: UnitPoint(x: 0.14, y: 0),
                            endPoint: UnitPoint(x: 0.94, y: 1.13)
                        )
                    )
                    
                Text("Register term")
                        .font(.customFont(size: 23))
                        .foregroundColor(Color("fontColor"))
                        .padding(.top)
                }
            }
            
            ForEach(0..<(gradesItem?.count ?? 0), id: \.self) { index in
                VStack {
                    HStack {
                        Text(gradesItem?[index].itemname.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true || gradesItem?[index].itemname == "-" ?
                             "Missing name of the grade🤔" :
                                gradesItem?[index].itemname ?? "Missing name of the grade🤔")
                        
                        .font(.customFont(size: 27))
                        .foregroundColor(Color("FontWithouDark"))
                        .padding()
                        
                        Text(gradesItem?[index].percentageformatted.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true || gradesItem?[index].percentageformatted == "-" ?
                             "Missing of grade🤔" :
                                gradesItem?[index].percentageformatted ?? "Missing of grade🤔")
                        .font(.customFont(size: 25))
                        .foregroundColor(Color("FontWithouDark"))
                        
                    }
                    .padding()
                    .shadow(radius: 10)
                }   .frame(maxWidth: .infinity)
                    .padding()
                    .background(colors[index % colors.count])
                    .cornerRadius(24)
                    .padding(.horizontal, 15)
            }
        }
    }
    
    func makeDouble(s: String) -> Double {
        if let dotIndex = s.firstIndex(of: ".") {
            let substring = s[..<dotIndex]
            if let number = Double(substring) {
                return number
            }
        }
        return 0
    }
}

#Preview {
    MainView()
}
