//
//  RegisterView.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        //Header
        HeaderView(title: "ToDone", subtitle: "Register", background: .red)
        //InputForm
        Form {
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
            }
            TextField("Vorname", text: $viewModel.firstname)
                .autocorrectionDisabled()
                .autocapitalization(.none)
            TextField("Nachname", text: $viewModel.lastname)
                .autocorrectionDisabled()
                .autocapitalization(.none)
            TextField("E-Mail Adresse", text: $viewModel.email)
                .autocorrectionDisabled()
                .autocapitalization(.none)
            SecureField("Passwort", text: $viewModel.password)
            TDButton(buttontitle: "Erstelle einen Account", background: .green) {
                viewModel.register()
            }
            
        }
        .offset(y: -50)
        Spacer()
       
        
    }
}

#Preview {
    RegisterView()
}
