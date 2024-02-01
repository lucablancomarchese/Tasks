//
//  ToDoListItemViewViewModel.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

/// ViewModel for single ToDo Item 

class ToDoListItemViewViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)  //setzt dem item den Wert den er nicht hat
        
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()  //Deklarieren einer Variable db um Zugriff auf die Datenbank zu bekommen.
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
    
    
}
