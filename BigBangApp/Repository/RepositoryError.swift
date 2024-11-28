//
//  RepositoryError.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 27/11/24.
//
import Foundation

/// Enumeración que representa errores relacionados con operaciones de repositorios de datos.
///
/// `RepositoryError` define posibles errores que pueden ocurrir durante las operaciones
/// de lectura, escritura o manipulación de datos en repositorios, proporcionando información
/// útil para su manejo.
///
/// ### Casos de error
/// - `fileNotFound(path: String)`: Indica que el archivo no fue encontrado en la ruta especificada.
/// - `dataCorrupted`: Señala que los datos están corruptos.
/// - `decodingFailed`: Representa un fallo al intentar decodificar los datos.
/// - `encodingFailed`: Representa un fallo al intentar codificar los datos.
/// - `unknown(error: Error)`: Captura errores desconocidos, con el error subyacente.
///
/// ### Propiedades
/// - `localizedDescription`: Una descripción legible para el usuario que detalla el error.
///
/// ### Propósito
/// Esta enumeración permite manejar y depurar errores de forma clara y uniforme en aplicaciones
/// que interactúan con datos persistentes.
///
/// ### Ejemplo de uso
/// ```swift
/// func loadData(from path: String) throws -> Data {
///     guard FileManager.default.fileExists(atPath: path) else {
///         throw RepositoryError.fileNotFound(path: path)
///     }
///     // Más lógica...
/// }
///
/// do {
///     let data = try loadData(from: "invalidPath")
/// } catch let error as RepositoryError {
///     print(error.localizedDescription)
/// }
/// ```
enum RepositoryError: Error {
    /// Archivo no encontrado en la ruta especificada
    case fileNotFound(path: String)
    /// Los datos están corruptos
    case dataCorrupted
    /// Fallo en la decodificación de los datos
    case decodingFailed
    /// Fallo en la codificación de los datos
    case encodingFailed
    /// Error desconocido con su causa subyacente.
    case unknown(error: Error)
    
    /// Descripción detallada del error.
    var localizedDescription: String {
        switch self {
        case .fileNotFound(path: let path):
            return "File not found at \(path)"
        case .dataCorrupted:
            return "Data corrupted"
        case .decodingFailed:
            return "Decoding failed"
        case .encodingFailed:
            return "Encoding failed"
        case .unknown(error: let error):
            return "Unknown error: \(error)"
        }
    }
}
