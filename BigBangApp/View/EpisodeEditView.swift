//
//  EpisodeEditView.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//

import SwiftUI

struct EpisodeEditView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var bigBangVM: BigBangViewModel
    @ObservedObject var episodeEditVM: EpisodeEditViewModel
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Section {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.secondary.opacity(0.1))
                            .shadow(radius: 2)
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Spacer()
                                Image("\(episodeEditVM.episode.episodeData.image)")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .frame(maxWidth: 250)
                                Spacer()
                            }
                            LabeledContent {
                                Text("\(episodeEditVM.episode.episodeData.name)")
                            } label: {
                                Text("Name:").font(.headline)
                            }
                            .padding(.top, 20)
                            LabeledContent {
                                Text("\(episodeEditVM.episode.episodeData.seasonAndEpisode)")
                            } label: {
                                Text("Season & Episode:").font(.headline)
                            }
                            LabeledContent {
                                Text("\(episodeEditVM.episode.episodeData.airdate)")
                            } label: {
                                Text("Airdate:").font(.headline)
                            }
                            LabeledContent {
                                Text("\(episodeEditVM.episode.episodeData.runtimeInMinutes)")
                            } label: {
                                Text("Runtime:").font(.headline)
                            }
                            Text("Summary:").font(.headline)
                            Text("\(episodeEditVM.episode.episodeData.summary)")
                                .multilineTextAlignment(.leading)
                        }
                        .padding()
                    }
                } header: {
                    Text("Episode Information")
                        .font(.title).bold()
                        .padding(.vertical, 5)
                }
                Spacer()
                Divider()
                Section {
                    VStack(alignment: .leading) {
                        Text("Notes:").font(.headline)
                        TextField("Writte notes about this episode", text: $episodeEditVM.notes, axis: .vertical)
                        Stepper("Rating: \(episodeEditVM.rating)", value: $episodeEditVM.rating, in: 0...5, step: 1).font(.headline)
                        ProgressView(value: Double(episodeEditVM.rating), total: 5)
                            .progressViewStyle(.automatic)
                            .accentColor(episodeEditVM.progressColor(for: episodeEditVM.rating))
                            .padding()
                            .animation(.easeInOut(duration: 0.8), value: episodeEditVM.rating)
                                
                        
                        HStack {
                            Spacer()
                            Toggle(isOn: $episodeEditVM.isWatched) {
                                Image(systemName: "eye")
                            }
                            .font(.largeTitle)
                            .toggleStyle(.button)
                            .symbolVariant(episodeEditVM.isWatched ? .fill : .none)
                            .foregroundStyle(episodeEditVM.isWatched ? .blue : .gray)
                            .contentTransition(.symbolEffect(.replace))
                            
                            Toggle(isOn: $episodeEditVM.isFavorite) {
                                Image(systemName: "star")
                            }
                            .font(.largeTitle)
                            .toggleStyle(.button)
                            .symbolVariant(episodeEditVM.isFavorite ? .fill : .none)
                            .foregroundStyle(episodeEditVM.isFavorite ? .yellow : .gray)
                            .contentTransition(.symbolEffect(.replace))
                            Spacer()
                        }
                        
                    }
                } header: {
                    Text("Editable Controls")
                        .font(.title).bold()
                        .padding(.vertical, 5)
                }
                
            }
        }
        .navigationTitle("Episode Edit")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button { dismiss() } label: {
                    Text("Cancel")
                        .foregroundStyle(.red)
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    let updatedEpisode = episodeEditVM.updateEpisodeControlItems()
                    bigBangVM.update(updatedEpisode)
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EpisodeEditView(episodeEditVM: EpisodeEditViewModel(episode: .preview))
            .environmentObject(BigBangViewModel())
    }
}
