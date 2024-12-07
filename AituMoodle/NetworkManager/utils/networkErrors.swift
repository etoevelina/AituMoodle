//
//  networkErrors.swift
//  AituMoodle
//
//  Created by Алексей Азаренков on 02.12.2024.
//

enum NetworkError: Error {
    case noData
    case notFound
    case decodingError
    case encodingError
    case networkError(Error)
    case serverError
}
