//
//  BigBangViewModel.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import Foundation

final class BigBangViewModel: ObservableObject {
    let respository: Repository
    
    @Published var episodes: Episodes {
        didSet {
            do {
                try respository.save(episodes)
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
    
    init(respository: Repository = Repository()) {
        self.respository = respository
        do {
            self.episodes = try respository.loadEpisodes()
            if !episodes.isEmpty {
                seasonSelected = .defaultSeason
                updateFilteredEpisodes()
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
}
