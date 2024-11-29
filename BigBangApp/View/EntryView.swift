//
//  ContentView.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import SwiftUI

/// Vista principal que presenta un `TabView` con dos pestañas: una para la lista de episodios y otra para los favoritos.
///
/// `EntryView` es la vista de entrada que proporciona acceso a dos secciones principales de la aplicación:
/// 1. **Episodios**: Muestra una lista de episodios a través de la vista `EpisodesListView`.
/// 2. **Favoritos**: Muestra una lista de episodios favoritos a través de la vista `FavouritesView`.
///
/// ### Propiedades:
/// No tiene propiedades adicionales. Solo contiene un `TabView` que organiza las vistas en dos pestañas.
///
/// ### Funcionalidad:
/// - `TabView`: Es un contenedor que permite cambiar entre vistas usando pestañas en la parte inferior de la pantalla.
/// - Cada pestaña tiene un ícono y un título, definidos mediante el modificador `tabItem`.
/// - La pestaña de episodios tiene un ícono de televisión y el texto "Episodes".
/// - La pestaña de favoritos tiene un ícono de estrella y el texto "Favorites".
///
/// ### Uso:
/// Esta vista se utiliza como la pantalla principal de la aplicación, donde los usuarios pueden navegar entre los episodios y sus favoritos.

struct EntryView: View {
    var body: some View {
        TabView {
            EpisodesListView()
                .tabItem {
                    Label("Episodes", systemImage: "tv")
                }
            FavouritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

#Preview {
    EntryView.preview
}
