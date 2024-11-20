//
//  AuthView.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 23.11.2024.
//

import SwiftUI
import RiveRuntime

struct AuthView: View {
    @State var token = ""
    let pic = RiveViewModel(fileName: "teddy", stateMachineName: "Login Machine", artboardName: "Teddy")
    var body: some View {
        ZStack{
            LinearGradient(
            stops: [
            Gradient.Stop(color: Color(red: 0.83, green: 0.76, blue: 1), location: 0),
            Gradient.Stop(color: Color(red: 0.52, green: 0.08, blue: 0.64), location: 1),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1.43)
            )
            
            VStack{
                pic.view()
                
                VStack (alignment: .center ){
                    
                    Group {
                        Text("Hi There!")
                            .font(.customFont(size: 22))
                        Text("Send your Moodle Token and let's get started")
                            .font(.customFont(size: 27))
                            .multilineTextAlignment(.center)
                            .padding(.top)
                    }.foregroundColor(.white)
                    
                    TextField("", text: $token)
                        
                        .foregroundColor(.clear)
                        .frame(width: .infinity, height: 60)
                        .background(Color(red: 0.98, green: 0.87, blue: 0.99))
                        .cornerRadius(31)
                        .padding(.horizontal)
                    Button {
                        
                    } label: {
                        Text("Login")
                            .font(.customFont(size: 27))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(width: .infinity, height: 60)
                            .background(
                            LinearGradient(
                            stops: [
                            Gradient.Stop(color: Color(red: 0.95, green: 0.49, blue: 0.99), location: 0),
                            Gradient.Stop(color: Color(red: 0.55, green: 0.1, blue: 0.27), location: 0),
                            Gradient.Stop(color: Color(red: 0.87, green: 0.23, blue: 1), location: 1),
                            ],
                            startPoint: UnitPoint(x: 0, y: 0.5),
                            endPoint: UnitPoint(x: 1, y: 0.5)
                            )
                            )
                            .cornerRadius(31)
                            .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                }
            }
        }
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    AuthView()
}
