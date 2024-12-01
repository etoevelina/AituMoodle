//
//  AuthView.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 23.11.2024.
//

import SwiftUI
import RiveRuntime

struct AuthView: View {
    // @ObservedObject var vm = ApiClient()
    let defaults = UserDefaults.standard
    @State var token = ""
    let pic = RiveViewModel(fileName: "teddy", stateMachineName: "Login Machine", artboardName: "Teddy")
    var body: some View {
        ZStack{
           
            
            RiveViewModel(fileName: "shapes").view()
                .ignoresSafeArea()
                .blur(radius: 70)
                .background(
                    Image("Spline")
                        .blur(radius: 50)
                        .offset(x: 200, y: 100)
                )
            
            VStack (){
                VStack{
                    pic.view()
                }
                .frame(height: 300)
                
                VStack (alignment: .center, spacing: 20 ){
                    
                    
                    VStack {
                        Text("hi")
                            .font(.customFont(size: 24))
                        Text("send")
                            .font(.customFont(size: 29))
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top)
                        
                    }.frame(width: 340)
                        .foregroundColor(.white)
                    
                    TextField("", text: $token)
                        .foregroundColor(.black)
                        .frame(height: 60)
                        .background(Color(red: 0.98, green: 0.87, blue: 0.99))
                        .cornerRadius(31)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                    
                    Button {
                        //   vm.checkToken(token: token) { isValid in
                        //                            if isValid {
                        //                                print("Token is valid.")
                        //                            } else {
                        //                                print("Token is invalid.")
                        //                            }
                        defaults.set(true, forKey: "login")
                    } label: {
                        Text("login")
                            .font(.customFont(size: 27))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 0.55, green: 0.1, blue: 0.27), location: 0),
                                        Gradient.Stop(color: Color(red: 0.91, green: 0.76, blue: 0.89), location: 0),
                                        Gradient.Stop(color: Color(red: 1, green: 0.39, blue: 0.91), location: 1),
                                    ],
                                    startPoint: UnitPoint(x: 0, y: 0.5),
                                    endPoint: UnitPoint(x: 1, y: 0.5)
                                )
                            )
                            .cornerRadius(31)
                            .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                    .padding(.horizontal)
                } .padding(EdgeInsets(top: 30, leading: 20, bottom: 40, trailing: 20))
                    .cornerRadius(18)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(30)
                    .padding(.horizontal)
                
                HStack{
                    Button{
                        
                    } label:{
                        Text("howToFind")
                            .font(.customFont(size: 27))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(width: 346, height: 77)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(31)
                            .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 31)
                                    .inset(by: -0.5)
                                    .stroke(Color(red: 1, green: 1, blue: 1), lineWidth: 1)
                            )
                        
                    }
                    
                    
                }
                .padding(.top, 52)
                
            }
        }.ignoresSafeArea()
    }
    
}
#Preview {
    AuthView()
}
