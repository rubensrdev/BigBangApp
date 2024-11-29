//
//  EpisodeInformationCard.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 27/11/24.
//
import SwiftUI

/// Vista que muestra la información detallada de un episodio.
///
/// `EpisodeInformationCard` presenta los datos clave de un episodio, incluyendo
/// la imagen del episodio, nombre, temporada, fecha de emisión, duración y un resumen.
/// La información se organiza en una tarjeta visual con un diseño limpio y estructurado.
///
/// ### Temas
/// - Propiedades:
///   - vm: ViewModel que gestiona los datos del episodio a mostrar.
/// - Funcionalidad:
///   - Presentación de la imagen del episodio.
///   - Visualización de la información detallada del episodio (nombre, temporada, etc.).
///   - Despliegue de un resumen del episodio.
///
/// ### Uso
/// ```swift
/// EpisodeInformationCard(vm: episodeEditViewModel)
/// ```
///
/// ### Previsualización
/// Incluye un ejemplo de previsualización con datos de prueba.
struct EpisodeInformationCard: View {
    /// ViewModel que maneja los datos del episodio.
    ///
    /// El ViewModel contiene la información detallada que se mostrará en la tarjeta
    /// de información del episodio, incluyendo el nombre, temporada, fecha de emisión, etc.
    @ObservedObject var vm: EpisodeEditViewModel

    /// El cuerpo principal de la vista.
    ///
    /// Presenta una tarjeta que muestra la imagen, el nombre, la temporada y episodio,
    /// la fecha de emisión, la duración y el resumen del episodio. Los datos están organizados
    /// en secciones con separadores y encabezados adecuados.
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 15) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.primary.opacity(0.05))
                        .shadow(radius: 5)
                    VStack {
                        Image("\(vm.episode.episodeData.image)")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(maxWidth: 300)
                            .padding()
                    }
                }
                .padding(.bottom, 10)
                Group {
                    informationRow(label: "Name", value: vm.episode.episodeData.name)
                    Divider()
                    informationRow(label: "Season & Episode", value: vm.episode.episodeData.seasonAndEpisode)
                    Divider()
                    informationRow(label: "Airdate", value: vm.episode.episodeData.airdate)
                    Divider()
                    informationRow(label: "Runtime", value: "\(vm.episode.episodeData.runtimeInMinutes) minutes")
                }

                Divider()
                Text("Summary")
                    .font(.headline)
                    .padding(.top, 5)
                Text(vm.episode.episodeData.summary)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.secondary)
                    .frame(minHeight: 150)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.primary.opacity(0.05))
                    .shadow(radius: 5)
            )
        }
        .padding([.top, .bottom], 20)
    }

    /// Vista auxiliar que muestra una fila con un label y un valor.
    ///
    /// Se usa para mostrar las diferentes piezas de información, como el nombre
    /// del episodio, temporada, fecha de emisión, etc.
    private func informationRow(label: String, value: String) -> some View {
        HStack {
            Text("\(label):")
                .font(.headline)
                .foregroundStyle(.primary)
            Spacer()
            Text(value)
                .multilineTextAlignment(.trailing)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ScrollView {
        EpisodeInformationCard(vm: EpisodeEditViewModel(episode: .preview))
            .padding()
    }
}
