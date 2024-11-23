//
//  AuthViewModel.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 23.11.2024.
//

//import Foundation
//import SwiftUI
//
//class ApiClient: ObservableObject {
//    func checkToken(token: String, completion: @escaping (Bool) -> Void) {
//        let baseURL = "https://moodle.astanait.edu.kz/webservice/rest/server.php"
//        guard let urlString = URL(string: "\(baseURL)?wstoken=\(token)&wsfunction=core_webservice_get_site_info&moodlewsrestformat=json") else {
//            completion(false)
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: urlString) { data, response, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                completion(false)
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//                print("Invalid response")
//                completion(false)
//                return
//            }
//
//            if let data = data {
//                // Парсим JSON-ответ
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                        if let errorCode = json["errorcode"] as? String, errorCode == "invalidtoken" {
//                            print("Invalid token")
//                            completion(false) // Токен недействителен
//                        } else {
//                            completion(true) // Токен действителен
//                        }
//                    } else {
//                        completion(false) // Некорректный ответ
//                    }
//                } catch {
//                    print("JSON parsing error: \(error.localizedDescription)")
//                    completion(false) // Ошибка при парсинге
//                }
//            } else {
//                completion(false)
//            }
//        }
//        task.resume()
//    }
//}

