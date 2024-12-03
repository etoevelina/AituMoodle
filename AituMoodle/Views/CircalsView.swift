//
//  CircalsView.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 17.11.2024.
//

import SwiftUI

struct CircalsView: View {
    var body: some View {
        ZStack{
            Ellipse()
                .frame(width: 183, height: 183)
                .foregroundColor(Color(red: 0.79, green: 0.91, blue: 1))
            
            Ellipse()
                .frame(width: 183, height: 183)
                .foregroundColor(Color(red: 0.45, green: 0.73, blue: 0.93))
                .padding(.leading, 106)
                .padding(.bottom, 51)
            Ellipse()
                .frame(width: 142, height: 141)
                .foregroundColor(Color(red: 0.28, green: 0.54, blue: 0.72))
                .padding(.leading, 267)
                .padding(.bottom, 67)
        }
    }
}

#Preview {
    CircalsView()
}
