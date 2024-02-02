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
            ZStack {
                Rectangle().foregroundColor(.white).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    //Header
                    Spacer()
                    HeaderView(title: "Tasks", subtitle: "Sign Up", background: .white)
                    //LoginForm
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                        
                    TextField("Email", text: $viewModel.email)
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
                        .offset(y: -50)
                           
                    
                    SecureField("Password", text: $viewModel.password)
                        .frame(width: 300)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .font(.title3)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(13.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        .offset(y: -50)
                       
                    TDButton(buttontitle: "Sign Up", background:.blue ) {
                        viewModel.login()
                    }.padding().offset(y: -50)
                    
                   
                    
                    Spacer()
                        
                    //Link to Create Account
                    VStack {
                        Text("New Arround here?")
                        NavigationLink("Sign In", destination: RegisterView())
                    }
                    .padding(.bottom, 50)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
