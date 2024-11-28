//
//  Episode.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import Foundation

/// Una estructura que representa la información de los episodios BigBang Theory en la aplicación
///
/// `Episode` almacena toda la información relevante sobre un episodio de la serie
/// BigBang Theory  mediante la estructura `BigBang` y las propiedades de control del episodio
/// como favorito, visto, puntuación y notas.
///
/// ### Propósito
/// Este tipo de dato se usará en la carga y guardado de información desde un archivo JSON, manipularla
/// dentro de la aplicación y mostrarla en las vistas.
///
/// ### Temas
/// - Propiedades:
///     - `id`: Identificador único
///     - `episodeData`: estructura de tipo `BigBang`
///     - `favorite`: Favorito
///     - `watched`: Visto
///     - `rating`: Puntuación
///     - `notes`: Notas
/// - Protocolos:
///   - `Codable`: Permite codificar y decodificar datos.
///   - `Identifiable`: Facilita su uso en listas de SwiftUI.
///   - `Hashable`: Permite comparar objetos y usarlos en colecciones como `Set`.
///
/// ### Ejemplo de uso
/// ```swift
/// let preview: Episode = .init(episodeData: .preview,
///                              favorite: true,
///                              watched: true,
///                              rating: 3,
///                              notes: "Very funny episode, good moments too")
/// ``
struct Episode: Codable, Hashable, Identifiable {
    let episodeData: BigBang
    var favorite: Bool = false
    var watched: Bool = false
    var rating: Int = 0
    var notes: String = ""
    var id: Int {
        episodeData.id
    }
}

/// Un alias que representa una colección de episodios de la serie BigBang Theory.
typealias Episodes = [Episode]

/// Convierte una colección de objetos `BigBang` en una colección de episodios `Episodes`.
/// ### Propósito
/// Esta función es útil para mapear datos crudos de tipo `BigBang` a la estructura manejable
/// de `Episode`, que incluye funcionalidades adicionales como favoritos, puntuación y notas.
///
/// ### Parámetros
/// - `bigBangs`: Una colección de objetos `BigBang` que se desea convertir.
///
/// ### Retorno
/// Un array de tipo `Episodes` con cada elemento transformado a partir de los datos iniciales.
///
/// ### Ejemplo de uso
/// ```swift
/// let bigBangs: [BigBang] = [
///     .init(id: 1, name: "Pilot", airdate: "2007-09-24", runtimeInMinutes: 22, image: "pilot"),
///     .init(id: 2, name: "The Big Bran Hypothesis", airdate: "2007-10-01", runtimeInMinutes: 22, image: "bigBran")
/// ]
///
/// let episodes = convertBigBangsToEpisodes(bigBangs)
/// ```
func convertBigBangsToEpisodes(_ bigBangs: bigBangs) -> Episodes {
    bigBangs.map { Episode(episodeData: $0)}
}
