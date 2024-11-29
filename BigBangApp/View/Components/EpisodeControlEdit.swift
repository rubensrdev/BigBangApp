//
//  EpisodeControlEdit.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 27/11/24.
//
import SwiftUI

/// Vista para editar y controlar la información de un episodio.
///
/// `EpisodeControlEdit` proporciona una interfaz para modificar las notas, la clasificación
/// y el estado de visualización de un episodio. También incluye controles para marcar el
/// episodio como visto o favorito.
///
/// ### Temas
/// - Propiedades:
///   - vm: ViewModel que maneja los datos del episodio y las interacciones con ellos.
/// - Funcionalidad:
///   - Modificación de notas y clasificación del episodio.
///   - Controles para indicar si el episodio ha sido visto o agregado a favoritos.
///
/// ### Uso
/// ```swift
/// EpisodeControlEdit(vm: episodeEditViewModel)
/// ```
///
/// ### Previsualización
/// Incluye un ejemplo de previsualización con datos de prueba.
struct EpisodeControlEdit: View {
    /// ViewModel que gestiona los datos de edición del episodio.
    ///
    /// El ViewModel controla el estado de los campos editables como las notas,
    /// la clasificación, y los estados de "visto" y "favorito".
    @ObservedObject var vm: EpisodeEditViewModel
    
    /// El cuerpo principal de la vista.
    ///
    /// Contiene un formulario con campos para editar las notas del episodio,
    /// la clasificación mediante un Stepper, y el estado de "visto" y "favorito"
    /// con controles Toggle. También se incluye una barra de progreso visual
    /// que refleja la clasificación del episodio.
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
