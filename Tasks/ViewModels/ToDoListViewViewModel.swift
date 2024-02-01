//
//  ToDoListViewViewModel.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import Foundation
import FirebaseFirestore

/// Viewmodel for list of all items
/// Primary tab

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
