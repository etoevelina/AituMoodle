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
    
    @Published var user: User?
    @Published var courses: [Course]?
    @Published var grades: [Grades]?

    
    func fetchUser(token: String) async throws {
        let fetchRequest = URLRequest(url: Link.user(token: token).url)
        
        let (data, response) = try await URLSession.shared.data(for: fetchRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noData
        }
        
        print("Status code: \(httpResponse.statusCode)")
        
        if httpResponse.statusCode == 404 {
            throw NetworkError.notFound
        }
        
        do {
            let decodedUser = try JSONDecoder().decode(User.self, from: data)
            DispatchQueue.main.async {
                self.user = decodedUser
            }
        } catch {
            throw NetworkError.decodingError
        }
    }
    
    func fetchCourses(token: String) async throws {
        let fetchRequest = URLRequest(url: Link.course(token: token).url)
        
        let (data, response) = try await URLSession.shared.data(for: fetchRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noData
        }
        
        print("Status code: \(httpResponse.statusCode)")
        
        if httpResponse.statusCode == 404 {
            throw NetworkError.notFound
        }
        
        do {
            let decodedCourses = try JSONDecoder().decode([Course].self, from: data)
            DispatchQueue.main.async {
       
                
                self.courses = self.splitter(courses: decodedCourses)
            }
        } catch {
            throw NetworkError.decodingError
        }
    }
    
    func fetchGrades(token: String) async throws {
        let fetchRequest = URLRequest(url: Link.grade(token: token).url)
        
        let (data, response) = try await URLSession.shared.data(for: fetchRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noData
        }
        
        print("Status code: \(httpResponse.statusCode)")
        
        if httpResponse.statusCode == 404 {
            throw NetworkError.notFound
        }
        
        do {
            let decodedGrades = try JSONDecoder().decode([Grades].self, from: data)
            DispatchQueue.main.async {
                self.grades = decodedGrades
                self.indexingGrades()
            }
        } catch {
            throw NetworkError.decodingError
        }
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
    
    private func splitter(courses: [Course]) -> [Course] {
        
        var data = courses
        for i in 0..<data.count {
            let components = data[i].fullname.split(separator: " | ")
            if components.count == 2 {
                data[i].name = String(components[0])
                data[i].teacher = String(components[1])
            }
        }
        return data
    }
    
    private func indexingGrades() {
        if let courses = courses, let grades = grades {
            for i in 0..<courses.count {
                var course = courses[i]
                for grade in grades {
                    if grade.courseid == course.id {
                        course.grades = grade.gradeitems
                    }
                }
                self.courses?[i] = course
            }
        }
    }
    
}
