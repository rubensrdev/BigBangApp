//
//  EpisodeEditView.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//

import SwiftUI

/// Vista para editar los detalles de un episodio.
///
/// `EpisodeEditView` permite a los usuarios modificar los atributos de un episodio, como su estado de favorito, si ha sido visto, las notas y la calificación. El usuario puede cancelar o guardar los cambios.
///
/// ### Propiedades:
/// - `@Environment(\.dismiss) private var dismiss`: Un entorno que permite cerrar la vista actual.
/// - `@EnvironmentObject private var bigBangVM: BigBangViewModel`: Un objeto de vista model que gestiona los datos de los episodios y actualiza la lista después de guardar los cambios.
/// - `@ObservedObject var episodeEditVM: EpisodeEditViewModel`: Un objeto de vista model que maneja los datos específicos del episodio que se está editando.
///
/// ### Funcionalidad:
/// - **Formulario de edición**: Se utiliza un `Form` que contiene dos secciones para modificar la información y los controles del episodio.
/// - **Botones de cancelación y confirmación**: La barra de navegación contiene botones para cancelar o guardar los cambios.
///   - **Cancelar**: Cierra la vista sin guardar cambios.
///   - **Guardar**: Actualiza el episodio con los cambios realizados y cierra la vista.
/// - **`EpisodeInformationCard` y `EpisodeControlEdit`**: Son componentes personalizados que muestran y permiten editar los detalles del episodio y sus controles (favorito, visto, notas, calificación).
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



