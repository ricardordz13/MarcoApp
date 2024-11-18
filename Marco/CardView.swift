//
//  CardView.swift
//  Marco
//
//  Created by Ricardo Jorge Rodriguez Trevino on 17/11/24.
//

import SwiftUI

struct CardView: View {
    let artwork: Artwork
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(artwork.imagen)
                .resizable()
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
                .frame(maxWidth: UIScreen.main.bounds.width,
                       maxHeight: UIScreen.main.bounds.height * 0.5)
                .clipped() // Recorta cualquier contenido extra
                .cornerRadius(20)
            
            
            LinearGradient(
                colors: [Color.black.opacity(0.7), Color.clear],
                startPoint: .bottom,
                endPoint: .center
            )
            .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(artwork.titulo) // Título de la obra
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(artwork.artista) // Autor de la obra
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text(artwork.resumen) // Descripción de la obra
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding()
        }
        .padding(.horizontal)
    }
}
