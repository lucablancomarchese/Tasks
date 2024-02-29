//
//  DoneTasksView.swift
//  Tasks
//
//  Created by Luca Blanco Marchese on 05.02.24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct DoneTasksView: View {
    @StateObject var viewModel: TasksViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TasksViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                List(items) { item in
                    if item.isDone {
                        ToDoListItemView(item: item)
                            .swipeActions { Button {viewModel.delete(id: item.id )} label: {Text("Delete")}}.tint(.red)
                    }
                }.listStyle(PlainListStyle())
            }.navigationTitle("Done Tasks")
            
           
                
        }
    }
}

#Preview {
    DoneTasksView(userId: "AzKT1TUszpUf9NK9BZmqM1ayfky2")
}
