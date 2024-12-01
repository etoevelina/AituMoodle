//
//  DBViewModel.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 23.11.2024.
//

import Combine
import Foundation

enum Link {
    case user(token: String)
    
    var url: URL {
        switch self {
        case .user(let token):
            return URL(string: "http://31.129.107.189:8080/get_user_info/\(token)")!
        }
    }
}

enum NetworkError: Error {
    case noData
    case notFound
    case decodingError
}

final class ApiClient: ObservableObject {
        
    
    init() {}
    static let shared = ApiClient()
    
    func fetchUser(token: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
        let fetchRequest = URLRequest(url: Link.user(token: token).url)
        
        URLSession.shared.dataTask(with: fetchRequest) { (data, response, error) -> Void in
            if error != nil {
                print("Error in session != nil")
                completion(.failure(.noData))
                return
            } else {
                
                let httpResponse = response as? HTTPURLResponse
                print("status code: \(httpResponse?.statusCode ?? 0)")
                
                if httpResponse?.statusCode == 404 {
                    completion(.failure(.notFound))
                } else {
                    guard let safeData = data else { return }
                    
                    do {
                        let decodedUser = try JSONDecoder().decode(User.self, from: safeData)
                        
                        completion(.success(decodedUser))
                    } catch let decodeError{
                        print("Decoding error: \(decodeError.localizedDescription)")
                        completion(.failure(.decodingError))
                    }
                }
            }
         
        }.resume()
    }
    
}
