//
//  models.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 17.11.2024.
//

import Foundation
import SwiftUI

extension Font {
    static func customFont(size: CGFloat) -> Font {
        return Font.custom("OrelegaOne-Regular", size: size)
    }
}

struct Deadline: Identifiable, Codable {
    var id = UUID()
    let date: Date
    let name: String
}


struct Subject: Identifiable, Codable {
    var id = UUID()
    let name: String
    let teacher: String
    let deadlines: [Deadline]
    let lastMark: Int
    let attendance: Int
}
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()

struct Notifications: Identifiable, Codable{
    var id = UUID()
    let date: Date
    let subName: String
    let assName: String
    let previousMark: String
    let currentMark: String
}
