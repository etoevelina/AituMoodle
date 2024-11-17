//
//  models.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 17.11.2024.
//

import Foundation
import SwiftUI

extension Font {
    static let customFont = Font.custom("НазваниеШрифта", size: 17)
}


struct Subject: Identifiable, Codable {
    var id = UUID()
    let name: String
    let teacher: String
    let deadlines: String
    let lastMark: Int
    let attendance: Int
    
//    
//
//    init(id: UUID = UUID(), name: String, flagName: String, collection: String) {
//            self.id = id
//            self.name = name
//            self.flagName = flagName
//            self.collection = collection
//        }
}
