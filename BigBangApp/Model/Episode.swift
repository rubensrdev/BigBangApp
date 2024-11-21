//
//  Episode.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import Foundation

struct Episode: Codable, Hashable, Identifiable {
    let episodeData: BigBang
    var favorite: Bool = false
    var watched: Bool = false
    var rating: Int = 0
    var notes: String = ""
    var id: Int {
        episodeData.id
    }
}

typealias Episodes = [Episode]

func convertBigBangsToEpisodes(_ bigBangs: bigBangs) -> Episodes {
    bigBangs.map { Episode(episodeData: $0)}
}
