//
//  MainView.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 20.11.2024.
//

import SwiftUI

struct MainView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        NavigationView{
            ZStack{
                Group{
                    switch selectedTab {
                    case .bell:
                        NotificationsView()
                    case .home:
                        ContentView()
                    case .user:
                        UserView()
                    }
                }
                TupBarView()
            }.transition(.opacity)
            .animation(.easeInOut, value: selectedTab)
            
        }
    }
}

#Preview {
    MainView()
}
