//
//  ControlIcons.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 25/11/24.
//
import SwiftUI

/// Vista que muestra los iconos de control relacionados con un episodio.
///
/// `ControlIcons` presenta una serie de iconos y una calificación asociada al episodio.
/// Los iconos indican si el episodio es favorito, si se ha visto, si tiene notas,
/// y la calificación del episodio (si está disponible). Los iconos cambian de color
/// según el estado de cada propiedad del episodio.
///
/// ### Temas
/// - Propiedades:
///   - episode: Un objeto de tipo `Episode` que contiene los datos del episodio.
/// - Funcionalidad:
///   - Muestra un ícono de estrella si el episodio es favorito.
///   - Muestra un ícono de ojo si el episodio ha sido visto.
///   - Muestra un ícono de burbuja si el episodio tiene notas.
///   - Muestra la calificación del episodio en un círculo con un gradiente de color.
///
/// ### Uso
/// ```swift
/// ControlIcons(episode: episode)
/// ```
///
/// ### Previsualización
/// Incluye un ejemplo de previsualización con datos de prueba.
struct ControlIcons: View {
    
    /// Episodio que contiene los datos que se mostrarán en los iconos de control.
    let episode: Episode
    
    /// El cuerpo principal de la vista.
    ///
    /// Muestra un conjunto de iconos representando los estados del episodio: favorito,
    /// visto, con notas, y su calificación (si existe). Los iconos se representan con
    /// imágenes del sistema y cambian de color según las condiciones del episodio.
    var body: some View {
        HStack {
            if episode.favorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            } else {
                Image(systemName: "star")
                    .foregroundStyle(.gray)
            }
            if episode.watched {
                Image(systemName: "eye.fill")
                    .foregroundStyle(.blue)
            } else {
                Image(systemName: "eye")
                    .foregroundStyle(.gray)
            }
            if !episode.notes.isEmpty {
                Image(systemName: "bubble.and.pencil")
                    .foregroundStyle(.green)
            } else {
                Image(systemName: "bubble.and.pencil")
                    .foregroundStyle(.gray)
            }
            if episode.rating > 0 && episode.rating <= 5 {
                Text("\(episode.rating)")
                    .bold()
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(
                        Circle()
                            .fill(LinearGradient(colors: [.red, .orange, .cyan, .blue, .mint, .green, .yellow], startPoint: .leading, endPoint: .trailing))
                            
                            
                    )
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ControlIcons(episode: .preview)
}
