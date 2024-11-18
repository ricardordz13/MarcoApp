//
//  DetailsView.swift
//  Marco
//
//  Created by Ricardo Jorge Rodriguez Trevino on 17/11/24.
//

import SwiftUI
import MapKit
import Glur

struct DetailsView: View {
    let artwork: Artwork

    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 25.66, longitude: -100.30),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .top) {
                    Image("paloma")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                        .clipped()
                        .glur(radius: 10.0,
                              offset: 0.5,
                              interpolation: 0.3,
                              direction: .down
                        )
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.clear, Color.black]),
                                startPoint: .center,
                                endPoint: .bottom
                            )
                            .opacity(0.5)
                        )
                        .aspectRatio(contentMode: .fill) // Mantén el contenido ajustado

                    LinearGradient(
                        colors: [Color.black.opacity(0.7), Color.clear],
                        startPoint: .bottom,
                        endPoint: .center
                    )
                    
                    VStack {
                        Text(artwork.titulo) // Nombre de la obra
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 0.1)
                        
                        Text(artwork.artista) // Autor de la obra
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 400, alignment: .bottomLeading)
                    .padding(.bottom, 20)
                    .padding(.leading)
                }
                .padding(.top, -100)
                .ignoresSafeArea()

                VStack(alignment: .leading) {
                    
                    Text("Descripción General")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    Text(artwork.descripcion)
                    
                    Text("Calificación")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(hex: 0xED008C))
                        Text(String(format: "%.1f", calculateAverage(from: artwork.calificaciones)))
                    }
                    .padding(.vertical)
                    // Llamada a la vista de barras de calificación
                    RatingBarView(ratings: artwork.calificaciones)
                    
                    Text("Museo")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.vertical)

                    Map(
                        coordinateRegion: $region,
                        annotationItems: [artwork] // Pasamos artwork como un solo ítem
                    ) { artwork in
                        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: 25.66, longitude: -100.30)) {
                            Image(systemName: "bird.fill")
                                .foregroundColor(Color(hex: 0xED008C))
                        }
                    }
                    .frame(height: 200)

                }
                .padding()
            }
        }
    }
    // Función para calcular el promedio del array
    func calculateAverage(from ratings: [Int]) -> Double {
        guard !ratings.isEmpty else { return 0.0 }
        let total = ratings.reduce(0, +)
        return Double(total) / Double(ratings.count)
    }
}

#Preview {
}
