//
//  FavouritesView.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//

import SwiftUI

struct FavouritesView: View {
    
    @EnvironmentObject private var bigBangVM: BigBangViewModel
    
    let adaptativeGridItem: [GridItem] = [
        GridItem(.adaptive(minimum: 200, maximum: 300), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if !bigBangVM.favoriteEpisodes.isEmpty {
                    LazyVGrid(columns: adaptativeGridItem, spacing: 16) {
                        ForEach(bigBangVM.favoriteEpisodes) { episode in
                            NavigationLink(value: episode) {
                                ZStack(alignment: .bottomLeading) {
                                    Image(episode.episodeData.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 200)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .overlay(
                                            LinearGradient(
                                                colors: [.clear, .black.opacity(0.7)],
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                        )
                                    
                                    VStack(alignment: .leading) {
                                        Text(episode.episodeData.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .bold()
                                        Text("Season \(episode.episodeData.season), Episode \(episode.episodeData.number)")
                                            .font(.subheadline)
                                            .foregroundColor(.white.opacity(0.8))
                                    }
                                    .padding(30)
                                }
                                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 16)
                } else {
                    VStack(spacing: 16) {
                        Image(systemName: "star.slash.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 50)
                            .foregroundStyle(.secondary)
                        
                        Text("No favourite episodes yet.")
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationTitle("Favourites Episodes")
            .navigationDestination(for: Episode.self) { episode in
                EpisodeInformationCard(vm: EpisodeEditViewModel(episode: episode))
            }
            .safeAreaPadding()
        }
    }
}

#Preview {
    FavouritesView.preview
}
