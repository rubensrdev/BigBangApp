//
//  FavouritesView.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//

import SwiftUI

/// Vista que muestra los episodios favoritos.
///
/// `FavouritesView` permite visualizar todos los episodios marcados como favoritos. Si no hay episodios favoritos, muestra un mensaje indicando que aún no se ha agregado ninguno.
///
/// ### Propiedades:
/// - `@EnvironmentObject private var bigBangVM: BigBangViewModel`: Un objeto de vista model que gestiona los episodios favoritos y los actualiza en la vista.
/// - `let adaptativeGridItem: [GridItem]`: Un arreglo de `GridItem` que define la disposición de los episodios en un grid adaptable. La disposición es flexible y ajusta el tamaño de las celdas entre 200 y 300 puntos, con un espacio de 16 puntos entre ellas.
///
/// ### Funcionalidad:
/// - **Grid de episodios**: Se utiliza un `LazyVGrid` para mostrar los episodios favoritos en un grid adaptable. Cada celda muestra una imagen del episodio con su título y número de temporada y episodio.
/// - **Si no hay episodios favoritos**: Si la lista de episodios favoritos está vacía, se muestra un mensaje con un ícono de estrella tachada y un texto que indica que no hay episodios favoritos aún.
/// - **Navegación**: Cada celda es un `NavigationLink` que lleva a la vista de información del episodio cuando se selecciona.
///
/// ### Elementos visuales:
/// - **Imagen de fondo**: Cada episodio tiene una imagen que cubre toda la celda con un degradado en la parte inferior para mejorar la visibilidad del texto.
/// - **Texto sobre la imagen**: El título del episodio y su temporada y número están posicionados en la parte inferior izquierda de la imagen.
/// - **Icono y texto si no hay favoritos**: Si no hay episodios favoritos, se muestra un ícono de estrella tachada y un mensaje centrado diciendo "No favourite episodes yet."
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
