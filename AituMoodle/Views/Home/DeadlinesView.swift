//
//  DeadlinesView.swift
//  AituMoodle
//
//  Created by Алексей Азаренков on 04.12.2024.
//

import SwiftUI

struct DeadlinesView: View {
    let deadlines: [Deadline]?

    var body: some View {
        ScrollView {
            ForEach(deadlines ?? [], id: \.name) { deadline in
                VStack {
                    Text(getSafeText(deadline.name, fallback: "Missing name of the name🤔"))
                        .font(.headline)
                        .padding()

                    Text(getSafeText(deadline.formattedtime, fallback: "Missing time🤔"))
                        .font(.subheadline)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }
        .padding()
    }

    private func getSafeText(_ text: String, fallback: String) -> String {
        text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || text == "-" ? fallback : text
    }
}

#Preview {

}
