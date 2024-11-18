//
//  ContentView.swift
//  Marco
//
//  Created by Ricardo Jorge Rodriguez Trevino on 14/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var viewModel: [Artwork]
    
    var body: some View {
        
        TabView {
            ExhibitionsView()
                .tabItem { Image(systemName: "newspaper.fill")
                    Text("Novedades") }
            ExhibitionsView()
                .tabItem { Image(systemName: "calendar")
                    Text("Calendario") }
            ExhibitionsView()
                .tabItem { Image(systemName: "cart")
                    Text("Tienda") }
        }
        .accentColor(Color(hex: 0xED008C))
        .onAppear {
            for artwork in ArtworkViewModel().artworks{
                modelContext.insert(artwork)
            }
        }
    }
}

#Preview {
    ContentView()
}
