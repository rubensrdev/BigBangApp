//
//  Repository.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import Foundation

struct Repository {
    func loadJson() throws -> bigBangs {
        let url = Bundle.main.url(forResource: "BigBangData", withExtension: "json")!
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(bigBangs.self, from: data)
    }
}
