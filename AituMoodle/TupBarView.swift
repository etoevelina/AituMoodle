//
//  TupBarView.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 20.11.2024.
//

import SwiftUI
import RiveRuntime

struct TupBarView: View {
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                content
                
                
            }.padding(12)
                .background(Color("Color1").opacity(0.8))
                .background(.ultraThinMaterial)
                .cornerRadius(23)
                .shadow(radius: 5)
                .padding(.horizontal, 24)
        }
    }
    
    var content: some View {
        ForEach(tabItems) { item in
            Button {
                try? item.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    try? item.icon.setInput("active", value: false)
                }
                withAnimation {
                    selectedTab = item.tab
                }
            } label: {
                item.icon.view()
                    .frame(height: 56)
                    .opacity(selectedTab == item.tab ? 1 : 0.5)
                    .background(
                        VStack {
                            RoundedRectangle(cornerRadius: 2)
                                .frame(width: selectedTab == item.tab ? 25 : 0, height: 4)
                                .offset(y: -4)
                                .opacity(selectedTab == item.tab ? 1 : 0)
                            Spacer()
                        }
                    )
            }
        }
    }
    
}
#Preview {
    TupBarView()
}



struct TabItem: Identifiable{
    var id = UUID()
    var icon: RiveViewModel
    var tab: Tab
}

var tabItems = [
    TabItem(icon:RiveViewModel(fileName: "icons", stateMachineName:  "BELL_Interactivity", artboardName: "BELL"), tab: .bell ),
    TabItem(icon:RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), tab: .home ),
    TabItem(icon:RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), tab: .user )
]

enum Tab: String{
    case bell
    case home
    case user
}
