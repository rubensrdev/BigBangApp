//
//  BigBangAppApp.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import SwiftUI

/// Archivo principal que define la estructura de la aplicación.
///
/// `BigBangAppApp` es el punto de entrada de la aplicación. Aquí se inicializa el `BigBangViewModel`, se define el entorno de la aplicación y se configura la vista inicial que se mostrará cuando la aplicación se ejecute.
///
/// ### Propiedades:
/// - `@StateObject private var bigbangVM = BigBangViewModel()`: Un objeto de vista model (`BigBangViewModel`) que se mantiene a lo largo del ciclo de vida de la aplicación. Este objeto gestiona el estado global y los datos que se utilizan en las vistas de la aplicación.
///
/// ### Funcionalidad:
/// - **Inicialización de la vista de entrada**: La aplicación muestra la vista `EntryView` como la primera pantalla cuando la aplicación se lanza. `EntryView` contiene la vista de la lista de episodios y favoritos de la serie.
/// - **EnvironmentObject**: Se pasa el `bigbangVM` como un `environmentObject` a las vistas hijas, permitiendo que las vistas dentro de la jerarquía de vistas tengan acceso al mismo modelo de vista y sus datos.
@main
struct BigBangAppApp: App {
    
    @StateObject private var bigbangVM = BigBangViewModel()
    
    var body: some Scene {
        WindowGroup {
            EntryView()
        }
        .environmentObject(bigbangVM)
    }
}
