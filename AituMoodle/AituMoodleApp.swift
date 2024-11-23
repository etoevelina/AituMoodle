//
//  AituMoodleApp.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 17.11.2024.
//

import SwiftUI

@main
struct AituMoodleApp: App {
    var body: some Scene {
        let defaults = UserDefaults.standard.value(forKey: "login")
        WindowGroup {
            if (defaults != nil) == true {
                MainView()
            } else {
                AuthView()
            }
        }
    }
}
