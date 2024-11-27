//
//  PreviewViews.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//

import SwiftUI

extension BigBang {
    static let preview: BigBang = .init(
        id: 2956,
        url: URL(string: "https://www.tvmaze.com/episodes/2956/the-big-bang-theory-3x04-the-pirate-solution")!,
        name: "The Pirate Solution",
        season: 3,
        number: 4,
        airdate: "2009-10-12",
        runtime: 30,
        image: "12469",
        summary: "Raj must find a new job or be sent back to India, but Sheldon has a solution, which leaves Leonard and Penny dealing with Howard as third wheel.\n"
    )
}

extension Episode {
    static let preview: Episode = .init(
        episodeData: .preview,
        favorite: false,
        watched: false,
        rating: 3,
        notes: "Very funny episode, good moments too"
    )
}

extension EntryView {
    static var preview: some View {
        EntryView()
            .environmentObject(BigBangViewModel(repository: RepositoryPreview()))
    }
}

extension EpisodesListView {
    static var preview: some View {
        EpisodesListView()
            .environmentObject(BigBangViewModel(repository: RepositoryPreview()))
    }
}

extension EpisodeEditView {
    static var preview: some View {
        EpisodeEditView(episodeEditVM: EpisodeEditViewModel(episode: .preview))
            .environmentObject(BigBangViewModel(repository: RepositoryPreview()))
    }
}

extension FavouritesView {
    static var preview: some View {
        FavouritesView()
            .environmentObject(BigBangViewModel(repository: RepositoryPreview()))
    }
}
