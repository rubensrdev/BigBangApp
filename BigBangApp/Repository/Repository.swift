//
//  Repository.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import Foundation



struct Repository: RepositoryProtocol {
    
    var urlDataJson: URL {
        Bundle.main.url(forResource: "BigBangData", withExtension: "json")!
    }
    
    var urlDataSave: URL {
        .documentsDirectory.appending(path: "/BigBangDataSave.json")
    }
    
    func loadEpisodes() throws -> Episodes {
        if FileManager.default.fileExists(atPath: urlDataSave.path()) {
            print("Loading episodes from file in \(urlDataSave.path())")
            let data = try Data(contentsOf: urlDataSave)
            return try JSONDecoder().decode(Episodes.self, from: data)
        } else {
            print("Loading episodes from json")
            let data = try Data(contentsOf: urlDataJson)
            let bigBangs = try JSONDecoder().decode(bigBangs.self, from: data)
            let episodes = convertBigBangsToEpisodes(bigBangs)
            try saveEpisodes(episodes)
            return episodes
        }
    }
}


