//
//  Episode.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import Foundation

struct Episode {
    let episodeData: BigBang
    var favorite: Bool = false
    var watched: Bool = false
    var rating: Int = 0
    var notes: String = ""
    var id: Int {
        episodeData.id
    }
}
