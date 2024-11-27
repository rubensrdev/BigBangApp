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
                EpisodeInformationCard(vm: episodeEditVM)
                Spacer()
                Divider()
                EpisodeControlEdit(vm: episodeEditVM)
                
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
        EpisodeEditView.preview
    }
}



