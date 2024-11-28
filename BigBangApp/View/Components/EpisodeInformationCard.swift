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
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 15) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.primary.opacity(0.05))
                        .shadow(radius: 5)
                    VStack {
                        Image("\(vm.episode.episodeData.image)")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(maxWidth: 300)
                            .padding()
                    }
                }
                .padding(.bottom, 10)
                Group {
                    informationRow(label: "Name", value: vm.episode.episodeData.name)
                    Divider()
                    informationRow(label: "Season & Episode", value: vm.episode.episodeData.seasonAndEpisode)
                    Divider()
                    informationRow(label: "Airdate", value: vm.episode.episodeData.airdate)
                    Divider()
                    informationRow(label: "Runtime", value: "\(vm.episode.episodeData.runtimeInMinutes) minutes")
                }

                Divider()
                Text("Summary")
                    .font(.headline)
                    .padding(.top, 5)
                Text(vm.episode.episodeData.summary)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.secondary)
                    .frame(minHeight: 150)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.primary.opacity(0.05))
                    .shadow(radius: 5)
            )
        }
        .padding([.top, .bottom], 20)
    }

    private func informationRow(label: String, value: String) -> some View {
        HStack {
            Text("\(label):")
                .font(.headline)
                .foregroundStyle(.primary)
            Spacer()
            Text(value)
                .multilineTextAlignment(.trailing)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ScrollView {
        EpisodeInformationCard(vm: EpisodeEditViewModel(episode: .preview))
            .padding()
    }
}
