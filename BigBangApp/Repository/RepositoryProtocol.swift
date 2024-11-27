//
//  RepositoryProtocol.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 27/11/24.
//
import Foundation

protocol RepositoryProtocol {
    var urlDataJson: URL { get }
    var urlDataSave: URL { get }
    func loadEpisodes() throws -> Episodes
    func saveEpisodes(_ episodes: Episodes) throws
}

extension RepositoryProtocol {
    func loadEpisodesAction(from url: URL) throws -> Episodes {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(Episodes.self, from: data)
    }
    func saveEpisodes(_ episodes: Episodes) throws {
        let data = try JSONEncoder().encode(episodes)
        try data.write(to: urlDataSave, options: [.atomic, .completeFileProtection])
    }
}
