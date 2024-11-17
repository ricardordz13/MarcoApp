//
//  PerfilView.swift
//  Marco
//
//  Created by Erick Flores on 16/11/24.
//

import SwiftUI

struct PerfilView: View {
    @State private var email = "correo@correo.com"
    @State private var password = "****"
    @State private var metodoPago = "****"
    
    var body: some View {
        NavigationView {
            VStack {
                // Foto de perfil
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .padding(.top, 20)
                
                // Nombre de usuario
                HStack {
                    Text("Luis Pérez")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Button(action: {
                        // Acción para editar el nombre
                    }) {
                        Image(systemName: "pencil")
                            .foregroundColor(.pink)
                    }
                }
                .padding(.top, 10)
                
                // Campo de correo
                VStack(alignment: .leading) {
                    Text("Correo")
                        .font(.headline)
                    TextField("Correo", text: $email)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Campo de contraseña
                VStack(alignment: .leading) {
                    Text("Contraseña")
                        .font(.headline)
                    SecureField("Contraseña", text: $password)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Botón de boleto
                VStack(alignment: .leading) {
                    Text("Mis boletos")
                        .font(.headline)
                    
                    Button(action: {
                        // Acción para ver boletos
                    }) {
                        Text("Ticket")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.pink.opacity(0.3))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Campo de método de pago
                VStack(alignment: .leading) {
                    Text("Método de Pago")
                        .font(.headline)
                    SecureField("Método de Pago", text: $metodoPago)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                Spacer()
            }
            .navigationBarTitle("Perfil", displayMode: .large)
            .navigationBarItems(
                leading: Button(action: {
                    // Acción para Novedades
                }) {
                    VStack {
                        Image(systemName: "doc.text")
                        Text("Novedades")
                            .font(.caption)
                    }
                },
                trailing: Button(action: {
                    // Acción para Tienda
                }) {
                    VStack {
                        Image(systemName: "cart")
                        Text("Tienda")
                            .font(.caption)
                    }
                }
            )
        }
        .background(Color.white.ignoresSafeArea())
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView()
    }
}
