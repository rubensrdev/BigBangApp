//
//  BigBangModel.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import Foundation

struct BigBang: Codable, Hashable, Identifiable {
    let id: Int
    let url: URL
    let name: String
    let season, number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
}

typealias bigBangs = [BigBang]

extension BigBang {
    var seasonAndEpisode: String {
        "S\(season) E\(number)"
    }
}
