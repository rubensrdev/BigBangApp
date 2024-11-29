//
//  RepositoryPreview.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 27/11/24.
//
import Foundation

/// `RepositoryPreview` es una implementación de `RepositoryProtocol` para cargar y guardar
/// episodios utilizando datos de prueba o previsualización.
///
/// ### Propósito
/// Esta estructura está diseñada para cargar datos desde un archivo JSON en el bundle
/// o desde un archivo de prueba guardado en el directorio de documentos.
///
/// ### Detalles
/// - Si el archivo en `urlDataSave` existe, los episodios se cargarán desde ahí.
/// - Si no existe, se cargan desde un archivo JSON de recursos del bundle y se guardan en `urlDataSave`.
///
/// ### Propiedades
/// - `urlDataJson`: La URL del archivo JSON en el bundle.
/// - `urlDataSave`: La URL del archivo de previsualización en el directorio de documentos.
///
/// ### Métodos
/// - `loadEpisodes() throws -> Episodes`: Carga los episodios según la lógica mencionada.
///
/// ### Ejemplo de uso
/// ```swift
/// let previewRepository = RepositoryPreview()
/// do {
///     let episodes = try previewRepository.loadEpisodes()
///     print(episodes)
/// } catch {
///     print("Error loading episodes: \(error)")
/// }
/// ```
struct RepositoryPreview: RepositoryProtocol {
    
    /// URL del archivo JSON de prueba en el Bundle
    var urlDataJson: URL {
        Bundle.main.url(forResource: "BigBangDataTest", withExtension: "json")!
    }
    
    /// URL del archivo de previsualización en el directorio de documentos
    var urlDataSave: URL {
        .documentsDirectory.appending(path: "/BigBangDataSavePreview.json")
    }
    
    /// Carga los episodios según la disponmibilidad del archivo
    /// - Returns: Una lista de `Episodes` cargada desde los datos disponibles (archivo en Documents o Bundle)
    /// - Throws: Un error de tipo `RepositoryError` si ocurre algún fallo
    func loadEpisodes() throws -> Episodes {
        do {
            if FileManager.default.fileExists(atPath: urlDataSave.path()) {
                print("Loading episodes from FILE PREVIEW in \(urlDataSave.path())")
                let data = try Data(contentsOf: urlDataSave)
                return try JSONDecoder().decode(Episodes.self, from: data)
            } else {
                print("Loading episodes from JSON PREVIEW")
                let data = try Data(contentsOf: urlDataJson)
                let bigBangs = try JSONDecoder().decode(bigBangs.self, from: data)
                let episodes = convertBigBangsToEpisodes(bigBangs)
                try saveEpisodes(episodes)
                return episodes
            }
        } catch let error as DecodingError {
            throw RepositoryError.decodingFailed
        } catch {
            throw RepositoryError.unknown(error: error)
        }
    }
}
