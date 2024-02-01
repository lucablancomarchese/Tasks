//
//  LoginViewViewModel.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {     
            return
        }
        
       
        Auth.auth().signIn(withEmail: email, password: password)    //LogIn Versuch mit Firebase
        
        print("Login Erfolgreich!")
        
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all the lines!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please put a valid mail!"
            return false
        }
        return true
    }
    
}
