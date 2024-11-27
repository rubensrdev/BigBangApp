//
//  BigBangViewModel.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import Foundation

final class BigBangViewModel: ObservableObject {
    let repository: RepositoryProtocol
    
    @Published var episodes: Episodes {
        didSet {
            do {
                try repository.saveEpisodes(episodes)
            } catch {
                print("Error saving episodes from var: \(error.localizedDescription)")
            }
        }
    }
    @Published var seasonSelected: OrderBySeason = .defaultSeason {
        didSet {
            updateFilteredEpisodes()
        }
    }
    @Published var searchText: String = "" {
        didSet {
            updateFilteredEpisodes()
        }
    }
    @Published var filteredEpisodes: Episodes = []
    @Published var favoriteEpisodes: Episodes = []
    
    
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
        do {
            self.episodes = try repository.loadEpisodes()
            if !episodes.isEmpty {
                seasonSelected = .defaultSeason
                updateFilteredEpisodes()
                updateFavoriteEpisodes()
            }
        } catch {
            print("Error loading episodes: \(error.localizedDescription)")
            self.episodes = []
        }
    }
    
    func updateFilteredEpisodes() {
        filteredEpisodes = episodes.filter { episode in
            let matchesSeason = episode.episodeData.season == seasonSelected.rawValue
            let matchesSearch = searchText.isEmpty || episode.episodeData.name.localizedCaseInsensitiveContains(searchText)
                return matchesSeason && matchesSearch
        }.sorted { $0.episodeData.number < $1.episodeData.number }
    }
    
    func update(_ episode: Episode) {
        if let index = episodes.firstIndex(where: { $0.id == episode.id }) {
            episodes[index] = episode
            updateFilteredEpisodes()
            updateFavoriteEpisodes()
        }
    }
    
    func updateFavoriteEpisodes() {
        favoriteEpisodes = episodes.filter { $0.favorite }
                                    .sorted { $0.episodeData.number < $1.episodeData.number }
    }
}
