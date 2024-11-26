//
//  EpisodeEditViewModel.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//

import Foundation
import SwiftUI

final class EpisodeEditViewModel: ObservableObject {
    
    let episode: Episode
    
    @Published var isFavorite: Bool = false
    @Published var isWatched: Bool = false
    @Published var rating: Int = 0
    @Published var notes: String = ""
    
    init(episode: Episode) {
        self.episode = episode
        self.isFavorite = episode.favorite
        self.isWatched = episode.watched
        self.rating = episode.rating
        self.notes = episode.notes
    }
    
    func progressColor(for rating: Int) -> Color {
        switch rating {
        case 0...1:
            return .red
        case 2:
            return .orange
        case 3:
            return .yellow
        case 4:
            return .green.opacity(0.4)
        case 5:
            return .green
        default:
            return .gray
        }
    }
    
}
