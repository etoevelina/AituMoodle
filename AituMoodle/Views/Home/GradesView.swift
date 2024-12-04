//
//  DeadlinesView.swift
//  AituMoodle
//
//  Created by Алексей Азаренков on 03.12.2024.
//

import SwiftUI

struct GradesView: View {
    
    let gradesItem: [GradeItem]?
    
    
    var body: some View {
        ScrollView {
            
           
            ForEach(0..<(gradesItem?.count ?? 0), id: \.self) { index in
                VStack{
                    if gradesItem?[index].itemname == "Register Term" {
                        if gradesItem?[index].percentageformatted != "-"{
                            VStack{
                                RingChart(
                                    percentage: makeDouble(s: gradesItem?[index].percentageformatted ?? "-"),
                                    gradient: LinearGradient(
                                        stops: [
                                        Gradient.Stop(color: Color(red: 0.2, green: 0.96, blue: 0.96), location: 0),
                                        Gradient.Stop(color: Color(red: 0, green: 0.41, blue: 0.78), location: 1),
                                        ],
                                        startPoint: UnitPoint(x: 0.14, y: 0),
                                        endPoint: UnitPoint(x: 0.94, y: 1.13)
                                        )
                                )
                            }
                        }
                    }
                    VStack {
                        Text(gradesItem?[index].itemname.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true || gradesItem?[index].itemname == "-" ?
                             "Missing name of the grade🤔" :
                                gradesItem?[index].itemname ?? "Missing name of the grade🤔")
                        
                        .font(.headline)
                        .padding()
                        
                        Text(gradesItem?[index].percentageformatted.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true || gradesItem?[index].percentageformatted == "-" ?
                             "Missing of grade🤔" :
                                gradesItem?[index].percentageformatted ?? "Missing of grade🤔")
                    }.padding().shadow(radius: 10)
                }
                
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
