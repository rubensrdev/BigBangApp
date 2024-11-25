//
//  EpisodeRow.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//
import SwiftUI

struct EpisodeRow: View {
    let episode: Episode
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(episode.episodeData.name)")
                    .font(.headline)
                Text("\(episode.episodeData.seasonAndEpisode)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                ControlIcons(episode: episode)
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

#Preview {
    NavigationStack {
        List {
            EpisodeRow(episode: .preview)
        }
    }
}


