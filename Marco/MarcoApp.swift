//
//  MarcoApp.swift
//  Marco
//
//  Created by Ricardo Jorge Rodriguez Trevino on 14/11/24.
//

import SwiftUI
import SwiftData

@main
struct MarcoApp: App {
    
    @Environment(\.modelContext) var modelContext
    @Query var viewModel: [Artwork]

    let modelContainer: ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(for: Artwork.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
        .modelContainer(modelContainer)        
    }
}
