//
//  ExhibitionsView.swift
//  Marco
//
//  Created by Ricardo Jorge Rodriguez Trevino on 16/11/24.
//

import SwiftUI
import Glur
import SwiftData

struct ExhibitionsView: View {
    @Environment(\.modelContext) var modelContext
    @Query var viewModel: [Artwork]
    // Formatted Date
    @State private var currentDate: Date = Date()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    HStack {
                        // Encabezado
                        Header(currentDate: $currentDate)
                    
                        Spacer()
                        
                        NavigationLink(destination: PerfilView()) {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Obras del mes
                    VStack(alignment: .leading) {
                        Text("Obras del Mes")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        ForEach(viewModel) { artwork in // Iterar sobre cada obra
                            NavigationLink(destination: DetailsView(artwork: artwork)) {
                                CardView(artwork: artwork)
                            }
                            .buttonStyle(PlainButtonStyle()) // Para evitar el efecto de botón en el CardView
                        }
                    }
                }
                .padding(.top)
            }
            .background(Color(.systemBackground))
            .navigationBarHidden(true)
        }
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
                        .foregroundColor(Color(hex: 0xED008C))
                }
            }
            
            Spacer()
            
        }
    }
}

struct ExposicionesView_Previews: PreviewProvider {
    static var previews: some View {
        ExhibitionsView()
    }
}
