//
//  EpisodeInformationCard.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 27/11/24.
//
import SwiftUI

struct EpisodeInformationCard: View {
    @ObservedObject var vm: EpisodeEditViewModel
    var body: some View {
        Section {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary.opacity(0.1))
                    .shadow(radius: 2)
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Spacer()
                        Image("\(vm.episode.episodeData.image)")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .frame(maxWidth: 250)
                        Spacer()
                    }
                    LabeledContent {
                        Text("\(vm.episode.episodeData.name)")
                    } label: {
                        Text("Name:").font(.headline)
                    }
                    .padding(.top, 20)
                    LabeledContent {
                        Text("\(vm.episode.episodeData.seasonAndEpisode)")
                    } label: {
                        Text("Season & Episode:").font(.headline)
                    }
                    LabeledContent {
                        Text("\(vm.episode.episodeData.airdate)")
                    } label: {
                        Text("Airdate:").font(.headline)
                    }
                    LabeledContent {
                        Text("\(vm.episode.episodeData.runtimeInMinutes)")
                    } label: {
                        Text("Runtime:").font(.headline)
                    }
                    Text("Summary:").font(.headline)
                    Text("\(vm.episode.episodeData.summary)")
                        .multilineTextAlignment(.leading)
                }
                .padding()
            }
        } header: {
            Text("Episode Information")
                .font(.title).bold()
                .padding(.vertical, 5)
        }
    }
}

#Preview {
    Form {
        VStack(alignment: .leading) {
            EpisodeInformationCard(vm: EpisodeEditViewModel(episode: .preview))
        }
        
    }
}
