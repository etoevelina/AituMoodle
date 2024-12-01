//
//  models.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 17.11.2024.
//

import Foundation
import SwiftUI


struct RoundedCornerShape: Shape { // 1
    let radius: CGFloat
    let corners: UIRectCorner

    func path(in rect: CGRect) -> Path { // 2
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

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

struct User: Decodable {
    let username: String
    let fullname: String
    let userid: Int
}
