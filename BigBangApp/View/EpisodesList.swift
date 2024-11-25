//
//  EpisodesList.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import SwiftUI

struct EpisodesList: View {
    @ObservedObject var bigBangVM = BigBangViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(bigBangVM.filteredEpisodes) { episode in
                    NavigationLink(value: episode) {
                        EpisodeRow(episode: episode)
                    }
                }
            }
            .navigationTitle("Big Bang Episodes")
            .searchable(text: $bigBangVM.searchText, prompt: "Search for an episode by name")
            .orderBySeason($bigBangVM.seasonSelected)
        }
    }
}

#Preview {
    EpisodesList()
}


