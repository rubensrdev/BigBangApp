//
//  ContentView.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import SwiftUI

struct EntryView: View {
    var body: some View {
        TabView {
            EpisodesList()
                .tabItem {
                    Label("Episodes", systemImage: "tv")
                }
            FavouritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

#Preview {
    EntryView()
        .environmentObject(BigBangViewModel())
}
