//
//  Artwork.swift
//  Marco
//
//  Created by Ricardo Jorge Rodriguez Trevino on 17/11/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Artwork {
    @Attribute( .unique) var id: Int
    var titulo: String
    var artista: String
    var resumen: String
    var descripcion: String
    var imagen: String
    var calificaciones: [Int]
    
    init(id: Int, titulo: String, artista: String, resumen: String, descripcion: String, imagen: String, calificaciones: [Int]) {
        self.id = id
        self.titulo = titulo
        self.artista = artista
        self.resumen = resumen
        self.descripcion = descripcion
        self.imagen = imagen
        self.calificaciones = calificaciones
    }
}
