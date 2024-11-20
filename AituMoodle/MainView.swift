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
        switch selectedTab {
        case .bell:
            ScholarShipView()
        case .home:
            ContentView()
        case .user:
            Text ("user")
        }
        
        TupBarView()
    }
}

#Preview {
    MainView()
}
