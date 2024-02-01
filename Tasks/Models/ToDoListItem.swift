//
//  ToDoListItem.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) { //mutating because it's in a struct
        isDone = state
    }
}
