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
                ForEach(bigBangVM.episodes) { episode in
                    VStack(alignment: .leading) {
                        Text("\(episode.name)")
                            .font(.headline)
                        Text("\(episode.seasonAndEpisode)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                    }
                }
            }
            .navigationTitle("Big Bang Episodes")
        }
    }
}

#Preview {
    EpisodesList()
}
