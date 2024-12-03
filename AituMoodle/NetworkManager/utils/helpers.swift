//
//  helpers.swift
//  AituMoodle
//
//  Created by Алексей Азаренков on 02.12.2024.
//

import Foundation

enum Link {
    case user(token: String)
    case course(token: String)
    case grade(token: String)
    case deadline(token: String)
    
    var url: URL {
        switch self {
        case .user(let token):
            return URL(string: "http://31.129.107.189:8080/get_user_info/\(token)")!
        case .course(let token):
            return URL(string: "http://31.129.107.189:8080/get_courses/\(token)")!
        case .grade(let token):
            return URL(string: "http://31.129.107.189:8080/get_grades/\(token)")!
        case .deadline(let token):
            return URL(string: "http://31.129.107.189:8080/get_deadlines/\(token)")!
        }
    }
}
