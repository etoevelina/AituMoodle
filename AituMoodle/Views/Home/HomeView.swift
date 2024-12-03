//
//  ContentView.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 17.11.2024.
//

import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        
        VStack{
            HStack{
                Text("welcome")
                    .font(.customFont(size: 51))
                    .foregroundColor(Color("fontColor"))
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()
            }
            
            VStack {
                SubCardView()
            }
            
            
            VStack{
                NavigationLink(destination: ScholarShipView()) {
                    Text("scholarship")
                        .font(.customFont(size: 29))
                        .foregroundColor(Color("FontWithouDark"))
                        .padding()
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.98, green: 0.77, blue: 0.99), location: 0),
                                    Gradient.Stop(color: Color(red: 0.95, green: 0.49, blue: 0.99), location: 0),
                                    Gradient.Stop(color: Color(red: 0.97, green: 0.75, blue: 0.99), location: 1),
                                ],
                                startPoint: UnitPoint(x: 0, y: 0.5),
                                endPoint: UnitPoint(x: 1, y: 0.5)
                            )
                        )
                        .cornerRadius(31)
                        .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.25), radius: 2, x: 0, y: 4)
                }
                
                // .padding(.bottom, 90)
            }
            
        }
        .padding(.bottom,100)

    }
}


#Preview {
    HomeView()
}
