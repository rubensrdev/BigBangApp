//
//  EpisodesList.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import SwiftUI

/// Vista que muestra una lista de episodios de *Big Bang* con funcionalidad de búsqueda y ordenación por temporada.
///
/// `EpisodesListView` permite a los usuarios ver una lista de episodios, filtrar por nombre mediante búsqueda y ordenar por temporada.
/// Los episodios pueden ser seleccionados para ver más detalles en una vista de edición.
///
/// ### Propiedades:
/// - `@EnvironmentObject private var bigBangVM: BigBangViewModel`: Un objeto de vista model que maneja los datos de los episodios, incluyendo la lista filtrada de episodios y el texto de búsqueda.
///
/// ### Funcionalidad:
/// - **Lista de episodios**: Utiliza un `List` que presenta los episodios filtrados a través del `bigBangVM.filteredEpisodes`.
/// - **Navegación**: Cada fila de la lista es un enlace (`NavigationLink`) a una vista de edición de episodio (`EpisodeEditView`), mostrando detalles del episodio seleccionado.
/// - **Búsqueda**: Permite a los usuarios buscar episodios por nombre mediante el modificador `searchable`.
/// - **Ordenación**: Utiliza un `ViewModifier` personalizado (`orderBySeason`) para permitir la ordenación de los episodios por temporada.
///
/// ### Uso:
/// Esta vista se utiliza para mostrar la lista de episodios de forma interactiva, permitiendo al usuario buscar, ordenar por temporada y navegar a una vista detallada de un episodio.
struct EpisodesListView: View {
    @EnvironmentObject private var bigBangVM: BigBangViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(bigBangVM.filteredEpisodes) { episode in
                    NavigationLink(value: episode) {
                        EpisodeRow(episode: episode)
                    }
                }
            }
            .navigationTitle("Big Bang Episodes")
            .navigationDestination(for: Episode.self, destination: { episode in
                EpisodeEditView(episodeEditVM: EpisodeEditViewModel(episode: episode))
            })
            .searchable(text: $bigBangVM.searchText, prompt: "Search for an episode by name")
            .orderBySeason($bigBangVM.seasonSelected)
        }
    }
}

#Preview {
    EpisodesListView.preview
}


