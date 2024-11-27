//
//  EpisodeControlEdit.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 27/11/24.
//
import SwiftUI

struct EpisodeControlEdit: View {
    @ObservedObject var vm: EpisodeEditViewModel
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text("Notes:").font(.headline)
                TextField("Writte notes about this episode", text: $vm.notes, axis: .vertical)
                Stepper("Rating: \(vm.rating)", value: $vm.rating, in: 0...5, step: 1).font(.headline)
                ProgressView(value: Double(vm.rating), total: 5)
                    .progressViewStyle(.automatic)
                    .accentColor(vm.progressColor(for: vm.rating))
                    .padding()
                    .animation(.easeInOut(duration: 0.8), value: vm.rating)
                HStack {
                    Spacer()
                    Toggle(isOn: $vm.isWatched) {
                        Image(systemName: "eye")
                    }
                    .font(.largeTitle)
                    .toggleStyle(.button)
                    .symbolVariant(vm.isWatched ? .fill : .none)
                    .foregroundStyle(vm.isWatched ? .blue : .gray)
                    .contentTransition(.symbolEffect(.replace))
                    
                    Toggle(isOn: $vm.isFavorite) {
                        Image(systemName: "star")
                    }
                    .font(.largeTitle)
                    .toggleStyle(.button)
                    .symbolVariant(vm.isFavorite ? .fill : .none)
                    .foregroundStyle(vm.isFavorite ? .yellow : .gray)
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
