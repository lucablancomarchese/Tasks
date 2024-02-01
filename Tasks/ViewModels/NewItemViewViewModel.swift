//
//  NewItemViewViewModel.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        //Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        //Create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        //Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool { //ueberprueft, ob Neues Item abgespeichert werden kann
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else { // überprüft, ob dueDate als gestern war
            return false
        }
        return true
    }
}
