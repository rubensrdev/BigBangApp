//
//  EpisodeEditViewModel.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//

import Foundation
import SwiftUI

/// Un modelo de vista para gestionar la lógica de edición de los detalles de un episodio ``Episode``
///
/// ``EpisodeEditViewModel`` gestiona el estado y lógica de edición de una instancia de ``Episode``
/// Utiliza las propiedades publicadas `@Published` para permitir actulizaciones reactivas desde la vista
///
/// ### Temas
/// - Propiedades:
///   - ``isFavorite``
///   - ``isWatched``
///   - ``rating``
///   - ``notes``
/// - Métodos:
///   - ``progressColor(for:)``
///   - ``updateEpisodeControlItems()``
///
/// ### Dependencias
///- Basado en el modelo ``Episode`` para proporcionar datos iniciales y generar un nuevo modelo actualizado
final class EpisodeEditViewModel: ObservableObject {
    
    /// El episodio original que se está editando
    var episode: Episode
    
    /// Indica si el episodio está marcado como favorito
    @Published var isFavorite: Bool = false
    
    /// Indica si el episodio está marcado como visto
    @Published var isWatched: Bool = false
    
    /// Indica si el episodio está puntuado
    @Published var rating: Int = 0
    
    /// Indica si el episodio tiene notas
    @Published var notes: String = ""
    
    /// Inicializa el modelo de vista con un episodio específico.
    ///
    /// Este método toma un ``Episode`` y convierte sus propiedades en valores editables.
    ///
    /// - Parameter episode: El episodio que se desea editar.
    init(episode: Episode) {
        self.episode = episode
        self.isFavorite = episode.favorite
        self.isWatched = episode.watched
        self.rating = episode.rating
        self.notes = episode.notes
    }
    
    /// Proporciona un color representativo basado en la puntuación del episodio.
    ///
    /// Este método traduce la puntuación de un episodio en un color visual para
    /// mejorar la representación de la calidad percibida del episodio.
    ///
    /// - Parameter rating: La puntuación del episodio, de 0 a 5.
    /// - Returns: Un color que representa la calidad del episodio.
    func progressColor(for rating: Int) -> Color {
        switch rating {
        case 0...1:
            return .red
        case 2:
            return .orange
        case 3:
            return .yellow
        case 4:
            return .green.opacity(0.4)
        case 5:
            return .green
        default:
            return .gray
        }
    }
    
    /// Actualiza los valores editados en el modelo ``Episode`` y devuelve un modelo actualizado.
    ///
    /// Este método aplica las modificaciones realizadas en las propiedades editables al
    /// modelo ``Episode`` y genera una nueva instancia con esos valores actualizados.
    ///
    /// - Returns: Una nueva instancia de ``Episode`` con los valores actualizados.
    func updateEpisodeControlItems() -> Episode {
        episode.favorite = isFavorite
        episode.watched = isWatched
        episode.rating = rating
        episode.notes = notes
        return Episode(episodeData: episode.episodeData, favorite: isFavorite, watched: isWatched, rating: rating, notes: notes)
    }
    
}
