//
//  EpisodeEditView.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//

import SwiftUI

struct EpisodeEditView: View {
    
    @EnvironmentObject private var bigBangVM: BigBangViewModel
    @ObservedObject var episodeEditVM: EpisodeEditViewModel
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Spacer()
                Section {
                    LabeledContent {
                        Text("\(episodeEditVM.episode.episodeData.name)")
                    } label: {
                        Text("Name")
                    }
                    LabeledContent {
                        Text("\(episodeEditVM.episode.episodeData.seasonAndEpisode)")
                    } label: {
                        Text("Season & Episode")
                    }
                    LabeledContent {
                        Text("\(episodeEditVM.episode.episodeData.airdate)")
                    } label: {
                        Text("Airdate")
                    }
                    LabeledContent {
                        Text("\(episodeEditVM.episode.episodeData.runtimeInMinutes)")
                    } label: {
                        Text("Runtime")
                    }
                } header: {
                    Text("Episode Information")
                        .font(.headline)
                }
                Spacer()
                Section {
                    
                } header: {
                    Text("Editable Controls")
                        .font(.headline)
                }
                Spacer()
            }
        }
        .navigationTitle("Episode Edit")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EpisodeEditView(episodeEditVM: EpisodeEditViewModel(episode: .preview))
        .environmentObject(BigBangViewModel())
}
