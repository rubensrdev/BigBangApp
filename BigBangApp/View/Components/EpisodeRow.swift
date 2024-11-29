//
//  EpisodeRow.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//
import SwiftUI

/// Vista que muestra la fila de un episodio en una lista.
///
/// `EpisodeRow` presenta el nombre del episodio, la temporada y el número del episodio,
/// junto con los iconos de control que indican el estado del episodio, como si es favorito,
/// si se ha visto, si tiene notas y su calificación. Además, muestra la imagen asociada al episodio.
///
/// ### Temas
/// - Propiedades:
///   - episode: Un objeto de tipo `Episode` que contiene los datos del episodio.
/// - Funcionalidad:
///   - Muestra el nombre y la temporada del episodio.
///   - Muestra los iconos de control que indican si el episodio es favorito, si se ha visto,
///     si tiene notas y su calificación.
///   - Muestra una imagen del episodio en un formato ajustado y con bordes redondeados.
///
/// ### Uso
/// ```swift
/// EpisodeRow(episode: episode)
/// ```
/// ### Previsualización
/// Incluye un ejemplo de previsualización con datos de prueba.
struct EpisodeRow: View {
    /// Episodio que contiene la información que se mostrará en la fila.
    let episode: Episode

    /// El cuerpo principal de la vista.
    ///
    /// Muestra el nombre y la temporada del episodio, los iconos de control relacionados con el episodio,
    /// y una imagen del episodio. Los elementos están organizados en una fila horizontal (HStack).
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(episode.episodeData.name)")
                    .font(.headline)
                Text("\(episode.episodeData.seasonAndEpisode)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                ControlIcons(episode: episode)
            }
            Spacer()
            Image(episode.episodeData.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 125)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    NavigationStack {
        List {
            EpisodeRow(episode: .preview)
        }
    }
}


