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

final class ApiClient: ObservableObject {
    
    @Published var user: User?
    
    func fetchUser(token: String) {
        let fetchRequest = URLRequest(url: Link.user(token: token).url)
        
        URLSession.shared.dataTask(with: fetchRequest) { [weak self] (data, response, error) in
            if let error = error {
                print("Error in session: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response from server")
                return
            }
            
            guard let safeData = data else {
                print("No data received")
                return
            }
            
            do {
                let decodedUser = try JSONDecoder().decode(User.self, from: safeData)
                DispatchQueue.main.async {
                    self?.user = decodedUser
                }
            } catch {
                print("Failed to decode user: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}
