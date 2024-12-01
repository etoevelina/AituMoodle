//
//  DBViewModel.swift
//  AituMoodle
//
//  Created by EvelinaAlexey on 23.11.2024.
//

import Combine
import Foundation

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
    
    func fetchCourses(token: String, completion: @escaping (Result<[Course], NetworkError>) -> Void) {
        let fetchRequest = URLRequest(url: Link.course(token: token).url)
        
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
                        let decodedCourses = try JSONDecoder().decode([Course].self, from: safeData)
                        
                        completion(.success(decodedCourses))
                    } catch let decodeError{
                        print("Decoding error: \(decodeError.localizedDescription)")
                        completion(.failure(.decodingError))
                    }
                }
            }
         
        }.resume()
    }
    
    func fetchGrades(token: String, completion: @escaping (Result<[Grades], NetworkError>) -> Void) {
        let fetchRequest = URLRequest(url: Link.grade(token: token).url)
        
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
                        let decodedGrades = try JSONDecoder().decode([Grades].self, from: safeData)
                        
                        completion(.success(decodedGrades))
                    } catch let decodeError{
                        print("Decoding error: \(decodeError.localizedDescription)")
                        completion(.failure(.decodingError))
                    }
                }
            }
         
        }.resume()
    }
    
    func fetchDeadlines(token: String, completion: @escaping (Result<[Deadline], NetworkError>) -> Void) {
        let fetchRequest = URLRequest(url: Link.deadline(token: token).url)
        
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
                        let decodedDeadlines = try JSONDecoder().decode([Deadline].self, from: safeData)
                        
                        completion(.success(decodedDeadlines))
                    } catch let decodeError{
                        print("Decoding error: \(decodeError.localizedDescription)")
                        completion(.failure(.decodingError))
                    }
                }
            }
         
        }.resume()
    }
    
}
