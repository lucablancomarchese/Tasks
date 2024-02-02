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
        NavigationView {
            ZStack {
                Rectangle().foregroundColor(.white).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Spacer()
                    //Header
                    HeaderView(title: "Tasks", subtitle: "Sign In", background: .white)
                    //InputForm
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Vorname", text: $viewModel.firstname)
                        .frame(width: 300)
                        .padding()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .font(.title3)
                        .background(Color.white)
                        .cornerRadius(13.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        .offset(y: -100)
                    TextField("Nachname", text: $viewModel.lastname)
                        .frame(width: 300)
                        .padding()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .font(.title3)
                        .background(Color.white)
                        .cornerRadius(13.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        .offset(y: -100)
                    TextField("E-Mail Adresse", text: $viewModel.email)
                        .frame(width: 300)
                        .padding()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .font(.title3)
                        .background(Color.white)
                        .cornerRadius(13.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        .offset(y: -100)
                    SecureField("Passwort", text: $viewModel.password)
                        .frame(width: 300)
                        .padding()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .font(.title3)
                        .background(Color.white)
                        .cornerRadius(13.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        .offset(y: -100)
                    
                    TDButton(buttontitle: "Sign In", background: .green) {
                        viewModel.register()
                    }.padding().offset(y: -50)
                    
                    
                    .offset(y: -50)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
