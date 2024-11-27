//
//  RepositoryError.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 27/11/24.
//
import Foundation

enum RepositoryError: Error {
    case fileNotFound(path: String)
    case dataCorrupted
    case decodingFailed
    case encodingFailed
    case unknown(error: Error)
    
    var localizedDescription: String {
        switch self {
        case .fileNotFound(path: let path):
            return "File not found at \(path)"
        case .dataCorrupted:
            return "Data corrupted"
        case .decodingFailed:
            return "Decoding failed"
        case .encodingFailed:
            return "Encoding failed"
        case .unknown(error: let error):
            return "Unknown error: \(error)"
        }
    }
}
