//
//  RepositoryPreview.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 27/11/24.
//
import Foundation

struct RepositoryPreview: RepositoryProtocol {

    var urlDataJson: URL {
        Bundle.main.url(forResource: "BigBangDataTest", withExtension: "json")!
    }
    
    var urlDataSave: URL {
        .documentsDirectory.appending(path: "/BigBangDataSavePreview.json")
    }
    
    func loadEpisodes() throws -> Episodes {
        do {
            if FileManager.default.fileExists(atPath: urlDataSave.path()) {
                print("Loading episodes from FILE PREVIEW in \(urlDataSave.path())")
                let data = try Data(contentsOf: urlDataSave)
                return try JSONDecoder().decode(Episodes.self, from: data)
            } else {
                print("Loading episodes from JSON PREVIEW")
                let data = try Data(contentsOf: urlDataJson)
                let bigBangs = try JSONDecoder().decode(bigBangs.self, from: data)
                let episodes = convertBigBangsToEpisodes(bigBangs)
                try saveEpisodes(episodes)
                return episodes
            }
        } catch let error as DecodingError {
            throw RepositoryError.decodingFailed
        } catch {
            throw RepositoryError.unknown(error: error)
        }
    }
}
