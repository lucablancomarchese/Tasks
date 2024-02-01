//
//  NewItemView.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel() //Erstellt Instanz von NewItemViewViewModel Klasse
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("New Task").font(.system(size: 32)).bold().padding()
            
            Form {
                //Title
                TextField("Title", text: $viewModel.title)
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Button
                TDButton(buttontitle: "Save", background: .green) {
                    
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }.padding()
            }.alert(isPresented: $viewModel.showAlert) { // prüft ob 
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select a due date that is newer than yesterday"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true}, set: {_ in }))
}
