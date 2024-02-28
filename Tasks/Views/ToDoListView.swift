//
//  ToDoListView.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private var uid: String
    
    
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
        
        self.uid = userId
    }
    
    var body: some View {
        NavigationView {
                VStack {
                    Divider()
                    List(items) { item in
                        if !item.isDone {
                            ToDoListItemView(item: item)
                                .swipeActions { Button {viewModel.delete(id: item.id )} label: {Text("Delete")}}.tint(.red)
                                
                        }
                        
                    }
                    .listStyle(PlainListStyle())
             
                }
                
                .navigationTitle("Tasks")
                .toolbar {
                    
                    NavigationLink(destination: DoneTasksView(userId: uid)) {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                        Button (){
                            viewModel.showingNewItemView = true
                        } label: {
                            Image(systemName: "plus").foregroundColor(Color(hex: "F0C43F"))
                        }
                    
                    }.sheet(isPresented: $viewModel.showingNewItemView) { //isPresented     erwartet ein boolschen Wert
                        NewItemView(newItemPresented: $viewModel.showingNewItemView)
                    }
                }
        }
    }
}

#Preview {
    ToDoListView(userId: "AzKT1TUszpUf9NK9BZmqM1ayfky2")
}
