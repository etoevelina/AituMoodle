//
//  DeadlinesView.swift
//  AituMoodle
//
//  Created by Алексей Азаренков on 04.12.2024.
//

import SwiftUI

struct DeadlinesView: View {
    let deadlines: [Deadline]?
    let colors = [
        Color(red: 0.88, green: 1, blue: 0.7),
        Color(red: 1, green: 0.93, blue: 0.7),
        Color(red: 0.98, green: 0.77, blue: 0.99)
    ]

    var body: some View {
        ScrollView {
            ForEach(Array((deadlines ?? []).enumerated()), id: \.element.name) { index, deadline in
                VStack {
                    Text(getSafeText(deadline.name, fallback: "Missing name of the name🤔"))
                        .font(.customFont(size: 27))
                        .foregroundColor(Color("FontWithouDark"))
                        .padding()

                    Text(getSafeText(deadline.formattedtime, fallback: "Missing time🤔"))
                        .font(.customFont(size: 20))
                        .foregroundColor(Color("FontWithouDark"))
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(colors[index % colors.count])
                .cornerRadius(24)
                .padding(.horizontal, 15)
            }
        }
        .padding()
    }

    private func getSafeText(_ text: String, fallback: String) -> String {
        text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || text == "-" ? fallback : text
    }
}

#Preview {
    MainView()
}
