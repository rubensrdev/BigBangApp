//
//  OrderBySeasonToolbar.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//
import SwiftUI

/// Un `ViewModifier` que agrega una barra de herramientas para ordenar episodios por temporada.
///
/// `OrderBySeasonToolbar` permite al usuario seleccionar una temporada para ordenar el contenido.
/// Esta barra de herramientas se agrega a cualquier vista usando el modificador `orderBySeason`.
///
/// ### Propiedades:
/// - `orderByOption`: Un enlace (`Binding`) al valor de la opción de temporada seleccionada.
///   Esta opción se actualiza cuando el usuario selecciona una temporada en el menú.
///
/// ### Funcionalidad:
/// - El modificador agrega un ítem de barra de herramientas en la posición superior izquierda.
/// - El ítem consiste en un `Menu` que permite al usuario seleccionar una temporada de las disponibles.
/// - Al seleccionar una opción, se actualiza el valor de `orderByOption` con la temporada seleccionada.
///
/// ### Uso
/// ```swift
/// .orderBySeason($orderByOption)
/// ```
struct OrderBySeasonToolbar: ViewModifier {
    /// Enlace a la opción de temporada seleccionada.
    @Binding var orderByOption: OrderBySeason
    
    /// Modifica la vista para agregar un menú de selección de temporada en la barra de herramientas.
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        ForEach(OrderBySeason.allCases) { season in
                            Button {
                                orderByOption = season
                            } label: {
                                Text("Season \(season.rawValue)")
                            }
                        }
                    } label: {
                        Text("Select season")
                    }
                }
            }
    }
}

extension View {
    /// Extensión de `View` que aplica el `OrderBySeasonToolbar` al contenido de la vista.
    ///
    /// - Parameter orderBySeason: El enlace a la opción de temporada seleccionada.
    /// - Returns: La vista modificada con el toolbar de selección de temporada.
    func orderBySeason(_ orderBySeason: Binding<OrderBySeason>) -> some View {
        modifier(OrderBySeasonToolbar(orderByOption: orderBySeason))
    }
}

/// Enumeración que representa las temporadas disponibles en el menú de selección.
///
/// Cada caso tiene un valor asociado que corresponde a un número de temporada, comenzando desde la temporada 1 hasta la temporada 12.
///
/// ### Propiedades:
/// - `id`: Conforma el protocolo `Identifiable` para poder usarse en la vista `ForEach`.
/// - `defaultSeason`: Representa la temporada predeterminada, que es la temporada 1.
enum OrderBySeason: Int, CaseIterable, Identifiable {
    case season1 = 1
    case season2 = 2
    case season3 = 3
    case season4 = 4
    case season5 = 5
    case season6 = 6
    case season7 = 7
    case season8 = 8
    case season9 = 9
    case season10 = 10
    case season11 = 11
    case season12 = 12
    
    var id: Self { self }
    
    /// La temporada predeterminada
    static let defaultSeason: OrderBySeason = .season1
}
