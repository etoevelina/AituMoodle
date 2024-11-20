//
//  ContentView.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 17.11.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    Text("Welcome back!")
                        .font(.customFont(size: 51))
                        .foregroundColor(Color(red: 0.22, green: 0.19, blue: 0.15))
                        .multilineTextAlignment(.leading)
                }.padding(.top)
                
                VStack {
                    SubCardView()
                        //.padding()
                      
                }
                .padding()
               // .padding(.bottom, 20)
                
                VStack{
                    NavigationLink(destination: ScholarShipView()) {
                        Text("Calculate scholarship")
                            .font(.customFont(size: 29))
                            .foregroundColor(Color(red: 0.22, green: 0.19, blue: 0.15))
                            .padding()
                            .background(Color(red: 0.98, green: 0.77, blue: 0.99))
                            .cornerRadius(31)
                            .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 70)
                }
                
                
            }
        }
    }
}


#Preview {
    ContentView()
}
