//
//  BigBangViewModel.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import Foundation

final class BigBangViewModel: ObservableObject {
    let respository: Repository
    @Published var episodes: bigBangs
    
    init(respository: Repository = Repository()) {
        self.respository = respository
        do {
            self.episodes = try respository.loadJson()
        } catch {
            print("Error en la carga del JSON: \(error.localizedDescription)")
            self.episodes = []
        }
    }
}
