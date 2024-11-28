//
//  BigBangModel.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import Foundation

/// Una estructura que representa la información de los episodios BigBang Theory
/// tal y como serán cargados la primera vez  y guardados posteriormente en otra estructura
///
/// `BigBang` almacena toda la información relevante sobre un episodio de la serie
/// BigBang Theory como su id, url, nombre, temporada, capítulo, fecha de emisión, duración
/// imagen y resumen.
///
/// ### Propósito
/// Este tipo de dato se usará la primera vez que se abra la aplicación y la información será almacenada
/// en otra estructura con otros datos de control del episodio.
///
/// ### Temas
/// - Propiedades:
///     - `id`: Identificador único
///     - `url`: URL de información
///     - `name`: Nombre
///     - `season`: Temporada
///     - `number`: Número
///     - `airdate`: Fecha de emisión
///     - `runtime`: Duración
///     - `image`: Imagen
///     - `summary`: Descripción
/// - Protocolos:
///   - `Codable`: Permite codificar y decodificar datos.
///   - `Identifiable`: Facilita su uso en listas de SwiftUI.
///   - `Hashable`: Permite comparar objetos y usarlos en colecciones como `Set`.
///
/// ### Ejemplo de uso
/// ```swift
///let preview: BigBang = .init(id: 2956,
///                             url: URL(string: "https://www.tvmaze.com/episodes/2956/the-big-bang-theory-3x04-the-pirate-solution")!,
///                             name: "The Pirate Solution",
///                             season: 3,
///                             number: 4,
///                             airdate: "2009-10-12",
///                             runtime: 30,
///                             image: "12469",
///                             summary: "Raj must find a new job or be sent back to India, but Sheldon has a solution, which leaves Leonard    and Penny dealing with Howard as third wheel.\n")
/// ``
struct BigBang: Codable, Hashable, Identifiable {
    let id: Int
    let url: URL
    let name: String
    let season, number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
}

typealias bigBangs = [BigBang]

extension BigBang {
    var seasonAndEpisode: String {
        "S\(season) E\(number)"
    }
    var runtimeInMinutes: String {
        "\(runtime) min"
    }
}
