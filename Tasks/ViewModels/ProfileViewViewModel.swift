//
//  ProfileViewViewModel.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ProfileViewViewModel: ObservableObject {
    init() {}
    
    @Published var user: User? = nil
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  firstname: data["firstname"] as? String ?? "",
                                  lastname: data["lastname"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
    }
}
