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
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(episode.episodeData.name)")
                                    .font(.headline)
                                Text("\(episode.episodeData.seasonAndEpisode)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                HStack {
                                    // TODO -> Los iconos de si es FAV, Visto, etc
                                }
                            }
                            Spacer()
                            Image(episode.episodeData.image)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 125)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
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
