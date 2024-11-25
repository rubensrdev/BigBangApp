//
//  EpisodeEditViewModel.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//

import Foundation

final class EpisodeEditViewModel: ObservableObject {
    
    let Episode: Episode
    
    @Published var isFavorite: Bool = false
    @Published var isWatched: Bool = false
    @Published var rating: Int = 0
    @Published var notes: String = ""
    
    init(Episode: Episode) {
        self.Episode = Episode
    }
    
}
