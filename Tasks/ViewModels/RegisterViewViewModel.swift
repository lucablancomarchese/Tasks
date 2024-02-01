//
//  RegisterViewViewModel.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var firstname = ""
    @Published var lastname = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func register() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            self?.insertUserID(id: userID)
        }
    }
    
    private func insertUserID(id: String) {
        let newUser = User(id: id, firstname: firstname, lastname: lastname, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !firstname.trimmingCharacters(in: .whitespaces).isEmpty,
              !lastname.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Error: Bitte alle Lücken ausfüllen!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Error: Bitte eine gültige Mail eingeben!"
            return false
        }
        
        guard password.count >= 8 else {
            errorMessage = "Error! Passwort muss mindestens 8 Zeichen haben!"
            return false
            
        }
        
       return true
    }
}
