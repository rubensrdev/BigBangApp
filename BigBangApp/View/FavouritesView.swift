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
        GridItem(.adaptive(minimum: 200))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if !bigBangVM.favoriteEpisodes.isEmpty {
                    LazyVGrid(columns: adaptativeGridItem) {
                        ForEach(bigBangVM.favoriteEpisodes) { episode in
                            NavigationLink(value: episode) {
                                ZStack {
                                    Image(episode.episodeData.image)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .frame(height: 250)
                                    Rectangle()
                                        .fill(.white.opacity(0.3))
                                        .frame(height: 100)
                                    Text(episode.episodeData.name)
                                        .font(.largeTitle)
                                        .bold()
                                        .padding(.trailing)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                } else {
                    Text("No favourite episodes yet.")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.secondary)
                    Image(systemName: "star.slash.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 100)
                        .foregroundStyle(.secondary)
                }
                
            }
            .navigationTitle("Favourites episodes")
            .navigationDestination(for: Episode.self) { episode in
                EpisodeInformationCard(vm: EpisodeEditViewModel(episode: episode))
            }
            .safeAreaPadding()
            
        
        }
    }
}

#Preview {
    FavouritesView()
        .environmentObject(BigBangViewModel())
}
