//
//  ExhibitionsView.swift
//  Marco
//
//  Created by Ricardo Jorge Rodriguez Trevino on 16/11/24.
//

import SwiftUI
import Glur

struct ExposicionesView: View {
    
    // Formatted Date
    @State private var currentDate: Date = Date()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                HStack {
                    // Encabezado
                    Header(currentDate: $currentDate)
                
                    Spacer()
                    
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding(.horizontal)
                
                // Obra del día
                VStack(alignment: .leading) {
                    Text("Obra del día")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    ZStack(alignment: .bottomLeading) {
                        Image("paloma")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .glur(radius: 8.0,
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
                                .opacity(1)
                            )
                            .cornerRadius(20)
                            .clipped()
                        
                        LinearGradient(
                            colors: [Color.black.opacity(0.7), Color.clear],
                            startPoint: .bottom,
                            endPoint: .center
                        )
                        .cornerRadius(20)
                        
                        VStack(alignment: .leading) {
                            Text("La Paloma")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("Juan Soriano")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            
                            Text("La obra captura la esencia de una paloma en un estilo minimalista.")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity,
                           maxHeight: UIScreen.main.bounds.height * 0.5,
                           alignment: .leading)
                }
                
                // Exposición del mes
                VStack(alignment: .leading) {
                    Text("Exposición del mes")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    Image("expoMes") // Reemplazar con tu imagen
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .cornerRadius(20)
                        .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .background(Color(.systemBackground))
        .navigationTitle("Exposiciones")
    }
}

// Header
@ViewBuilder
func Header(currentDate: Binding<Date>) -> some View { // Pass currentDate binding
    VStack {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(currentDate.wrappedValue.formatted(date: .complete, time: .omitted)) // Use currentDate.wrappedValue
                    .textCase(.uppercase)
                    .font(.footnote)
                    .foregroundColor(Color.secondary)
                
                Group {
                    Text(currentDate.wrappedValue.format("MMMM ")) // Use currentDate.wrappedValue
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primary) +
                    Text(currentDate.wrappedValue.format("YYYY")) // Use currentDate.wrappedValue
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.teal)
                }
            }
            
            Spacer()
            
        }
    }
}

struct ExposicionesView_Previews: PreviewProvider {
    static var previews: some View {
        ExposicionesView()
    }
}
