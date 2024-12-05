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
    @Published var deadlines: [Deadline]?


    
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
    
    func fetchDeadlines(token: String) async throws {
        let fetchRequest = URLRequest(url: Link.deadline(token: token).url)
        
        let (data, response) = try await URLSession.shared.data(for: fetchRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noData
        }
        
        print("Status code: \(httpResponse.statusCode)")
        
        if httpResponse.statusCode == 404 {
            throw NetworkError.notFound
        }
        
        do {
            let decodedDeadlines = try JSONDecoder().decode([Deadline].self, from: data)
            DispatchQueue.main.async {
                self.deadlines = decodedDeadlines
                self.indexingDeadlines()
            }
        } catch {
            throw NetworkError.decodingError
        }
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
    
    private func indexingDeadlines() {
        guard let courses = courses, let deadlines = deadlines else {
            print("Courses or deadlines are nil")
            return
        }
        
        for i in 0..<courses.count {
            var course = courses[i]
            let courseDeadlines = deadlines.filter { $0.course.id == course.id }
            
            if courseDeadlines.isEmpty {
//                print("No deadlines found for course: \(course.fullname)")
            } else {
//                print("Deadlines for course \(course.fullname): \(courseDeadlines)")
            }
            
            course.deadlines = courseDeadlines
            self.courses?[i] = course
        }
    }
    
}
