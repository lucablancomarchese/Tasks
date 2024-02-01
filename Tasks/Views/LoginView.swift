//
//  LoginView.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "ToDone", subtitle: "Log In", background: .yellow)
                //LoginForm
                Form {
                    
                    TextField("E-Mail Adresse", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Passwort", text: $viewModel.password)
                    TDButton(buttontitle: "Log In", background:.blue ) {
                        viewModel.login()
                    }
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                }
                .offset(y: -50)
                
                //Create Account
                VStack {
                    Text("Neu hier?")
                    NavigationLink("Registriere Dich", destination: RegisterView()) 
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
