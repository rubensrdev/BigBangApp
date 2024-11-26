//
//  ControlIcons.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//
import SwiftUI

struct ControlIcons: View {
    let episode: Episode
    var body: some View {
        HStack {
            if episode.favorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            } else {
                Image(systemName: "star")
                    .foregroundStyle(.gray)
            }
            if episode.watched {
                Image(systemName: "eye.fill")
                    .foregroundStyle(.blue)
            } else {
                Image(systemName: "eye")
                    .foregroundStyle(.gray)
            }
            if !episode.notes.isEmpty {
                Image(systemName: "bubble.and.pencil")
                    .foregroundStyle(.green)
            } else {
                Image(systemName: "bubble.and.pencil")
                    .foregroundStyle(.gray)
            }
            if episode.rating > 0 && episode.rating <= 5 {
                Text("\(episode.rating)")
                    .bold()
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(
                        Circle()
                            .fill(LinearGradient(colors: [.red, .orange, .cyan, .blue, .mint, .green, .yellow], startPoint: .leading, endPoint: .trailing))
                            
                            
                    )
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ControlIcons(episode: .preview)
}
