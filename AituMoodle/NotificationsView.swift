//
//  NotificationsView.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 21.11.2024.
//

import SwiftUI

struct NotificationsView: View {
    let notifications = [
        Notifications(date: Date(), subName: "Intoducing to programming 1", assName: "Register Term", previousMark: "N/A", currentMark: "100")
    ]
    let colors = [
        Color(red: 0.88, green: 1, blue: 0.7),
        Color(red: 1, green: 0.93, blue: 0.7),
        Color(red: 0.98, green: 0.77, blue: 0.99)
    ]
    
    var body: some View {
        HStack{
            Text("Notifications")
                .font(.customFont(size: 51))
                .foregroundColor(Color("fontColor"))
                .multilineTextAlignment(.leading)
                .padding()
            Spacer()
        }
        ScrollView{
            VStack{
                ForEach(0..<notifications.count, id: \.self) { index in
                    VStack{
                        
                        HStack{
                            Text(notifications.date, formatter: dateFormatter)
                        }
                        
                    }.background(colors[index % colors.count])
                }
            }
            
        }
    }
}

#Preview {
    NotificationsView()
}
