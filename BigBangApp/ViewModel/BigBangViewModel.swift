//
//  BigBangViewModel.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import Foundation

/// Un modelo de vista para gestionar la lógica de los episodios en la aplicación
/// ``BigBangViewModel`` actua como fuente de la verdad para los episodios de la serie, gestionando la interacción
/// entre el repositorio de datos y las vistas como un objeto global de la aplicación.
/// ### Temas
/// - Propiedades:
///   - ``repository``
///   - ``episodes``
///   - ``seasonSelected``
///   - ``searchText``
///   - ``filteredEpisodes``
///   - ``favoriteEpisodes``
/// - Métodos:
///   - ``updateFilteredEpisodes()``
///   - ``update(_:)``
///   - ``updateFavoriteEpisodes()``
///
/// ### Dependencias
/// - Basado en ``RepositoryProtocol`` para cargar y guardar datos de episodios.
/// - Utiliza la enumeración ``OrderBySeason`` para definir la temporada seleccionada.
///
final class BigBangViewModel: ObservableObject {
    /// El repositorio gestiona las operaciones de carga y guardadode datos
    ///
    /// La dependencia se inyecta en el inicializador, permitiendo distintas configuraciones
    /// por ejemplo, datos de prueba para entornos de desarrollo
    let repository: RepositoryProtocol
    
    /// La lista completa de episodios cargados y gestionados
    ///
    /// Cada vez que esta propiuedad cambia, los datos se guardan automáticamente en el repositorio
    @Published var episodes: Episodes {
        didSet {
            do {
                try repository.saveEpisodes(episodes)
            } catch {
                print("Error saving episodes from var: \(error.localizedDescription)")
            }
        }
    }
    
    /// La temporada seleccionada para filtrar los episodios
    ///
    /// Las opciones son valores definidos en ``OrderBySeason``
    /// Cuando cambia se actualizan los episodios filtrados automáticamente
    @Published var seasonSelected: OrderBySeason = .defaultSeason {
        didSet {
            updateFilteredEpisodes()
        }
    }
    
    /// El texto introducido para buscar episodios por su nombre
    ///
    /// Cuando cambia, los episodios filtrados se actualizan automáticamente
    @Published var searchText: String = "" {
        didSet {
            updateFilteredEpisodes()
        }
    }
    
    /// La lista de episodios filtrados por temporada y texto de búsqueda.
    ///
    /// Esta propiedad se actualiza dinámicamente según las opciones de filtrado actuales.
    @Published var filteredEpisodes: Episodes = []
    
    /// La lista de episodios marcados como favoritos.
    ///
    /// Esta propiedad se genera dinámicamente, mostrando solo los episodios que
    /// tienen la propiedad ``favorite`` marcada.
    @Published var favoriteEpisodes: Episodes = []
    
    /// Inicializa el modelo de vista cargando datos desde el repositorio proporcionado.
    ///
    /// Si la lista de episodios no está vacía, se inicializan las propiedades relacionadas
    /// con la temporada seleccionada y los episodios favoritos.
    ///
    /// - Parameter repository: El repositorio que gestiona las operaciones de datos. Por defecto,
    ///   se utiliza una instancia de producción.
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
        do {
            self.episodes = try repository.loadEpisodes()
            if !episodes.isEmpty {
                seasonSelected = .defaultSeason
                updateFilteredEpisodes()
                updateFavoriteEpisodes()
            }
        } catch {
            print("Error loading episodes: \(error.localizedDescription)")
            self.episodes = []
        }
    }
    
    /// Actuliza la lista de episodios filtrados según la temporada seleccionada y el texto de búsqueda
    ///
    /// Este método aplica los criterios de filtrado seleccionados y ordena los episodios por número
    func updateFilteredEpisodes() {
        filteredEpisodes = episodes.filter { episode in
            let matchesSeason = episode.episodeData.season == seasonSelected.rawValue
            let matchesSearch = searchText.isEmpty || episode.episodeData.name.localizedCaseInsensitiveContains(searchText)
                return matchesSeason && matchesSearch
        }.sorted { $0.episodeData.number < $1.episodeData.number }
    }
    
    /// Actualiza los datos de un episodio existente con nuevos datos.
    ///
    /// Este método localiza un episodio en la lista principal usando su ID y reemplaza sus datos con los proporcionados.
    /// También actualiza las listas de episodios fltrados y favoritos
    ///
    /// - Parameter episode: El episodio actualizado que debe reemplazar al existente
    func update(_ episode: Episode) {
        if let index = episodes.firstIndex(where: { $0.id == episode.id }) {
            episodes[index] = episode
            updateFilteredEpisodes()
            updateFavoriteEpisodes()
        }
    }
    
    /// Actualiza la lista de episodios favoritos
    ///
    /// Este método filtra y ordena los episodios que tiene la propiedad ``favorite`` marcada 
    func updateFavoriteEpisodes() {
        favoriteEpisodes = episodes.filter { $0.favorite }
                                    .sorted { $0.episodeData.number < $1.episodeData.number }
    }
}
