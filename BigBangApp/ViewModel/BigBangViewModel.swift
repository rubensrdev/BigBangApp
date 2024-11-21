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
    
    init(respository: Repository = Repository()) {
        self.respository = respository
        do {
            self.episodes = try respository.loadEpisodes()
        } catch {
            print("Error loading episodes: \(error.localizedDescription)")
            self.episodes = []
        }
    }
}
