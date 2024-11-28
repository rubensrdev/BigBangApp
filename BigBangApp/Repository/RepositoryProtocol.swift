//
//  RepositoryProtocol.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 27/11/24.
//
import Foundation

/// Protocolo que define las operaciones básicas para interactuar con un repositorio de episodios.
///
/// `RepositoryProtocol` establece los requisitos mínimos para cualquier implementación de
/// repositorio de datos, incluyendo las rutas de acceso a los datos y los métodos para
/// cargar y guardar información de los episodios.
///
/// ### Propósito
/// Este protocolo abstrae la lógica de almacenamiento y recuperación de episodios,
/// facilitando la sustitución o prueba de diferentes implementaciones de repositorios.
///
/// ### Propiedades
/// - `urlDataJson`: URL del archivo JSON de datos fuente.
/// - `urlDataSave`: URL del archivo donde se guardarán los datos actualizados.
///
/// ### Métodos
/// - `loadEpisodes() throws -> Episodes`: Carga una lista de episodios desde el repositorio.
/// - `saveEpisodes(_ episodes: Episodes) throws`: Guarda una lista de episodios en el repositorio.
///
/// ### Ejemplo de uso
/// ```swift
/// class FileRepository: RepositoryProtocol {
///     var urlDataJson: URL {
///         // Ruta al archivo JSON
///         URL(fileURLWithPath: "/path/to/episodes.json")
///     }
///     var urlDataSave: URL {
///         // Ruta al archivo de guardado
///         URL(fileURLWithPath: "/path/to/saveEpisodes.json")
///     }
///
///     func loadEpisodes() throws -> Episodes {
///         // Lógica para cargar episodios.
///     }
///
///     func saveEpisodes(_ episodes: Episodes) throws {
///         // Lógica para guardar episodios.
///     }
/// }
/// ```
/// Este protocolo es la base para repositorios
protocol RepositoryProtocol {
    
    /// URL del archivo JSON con los datos fuente
    var urlDataJson: URL { get }
    
    /// URL del archivo donde se guardarán los datos actualizados
    var urlDataSave: URL { get }
    
    /// Carga una lista de episodios desde el repositorio.
    /// - Returns: Una lista de episodios (`Episodes`).
    /// - Throws: Un error de tipo `RepositoryError` si ocurre algún problema durante la carga.
    func loadEpisodes() throws -> Episodes
    
    /// Guarda una lista de episodios en el repositorio.
    /// - Parameter episodes: La lista de episodios a guardar.
    /// - Throws: Un error de tipo `RepositoryError` si ocurre algún problema durante el guardado.
    func saveEpisodes(_ episodes: Episodes) throws
}

extension RepositoryProtocol {
    
    /// Carga episodios desde un archivo JSON.
    /// - Parameter url: La URL del archivo JSON a cargar.
    /// - Returns: Una lista de episodios (`Episodes`) decodificada desde el archivo.
    /// - Throws: Un error de tipo `RepositoryError` si ocurre un problema al cargar los datos.
    func loadEpisodesAction(from url: URL) throws -> Episodes {
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(Episodes.self, from: data)
        } catch let error as DecodingError {
            throw RepositoryError.decodingFailed
        } catch {
            throw RepositoryError.unknown(error: error)
        }
    }
    
    /// Guarda una lista de episodios en un archivo JSON.
    /// - Parameter episodes: La lista de episodios a guardar.
    /// - Throws: Un error de tipo `RepositoryError` si ocurre un problema durante el guardado.
    func saveEpisodes(_ episodes: Episodes) throws {
        do {
            let data = try JSONEncoder().encode(episodes)
            try data.write(to: urlDataSave, options: [.atomic, .completeFileProtection])
        } catch let error as EncodingError {
            throw RepositoryError.encodingFailed
        } catch {
            throw RepositoryError.unknown(error: error)
        }
    }
}
