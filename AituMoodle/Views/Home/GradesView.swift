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

#Preview {
//    GradesView()
}
