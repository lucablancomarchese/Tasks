//
//  ToDoListItemView.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    let item: ToDoListItem
    
    private var dueDate: Date {
            Date(timeIntervalSince1970: item.dueDate)
        }
    
    func calculateRemainingTime(from currentDate: Date, to dueDate: Date) -> String? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute], from: currentDate, to: dueDate)
        
        guard let days = components.day, let hours = components.hour, let minutes = components.minute else {
            return nil
        }
        
        if days == 0 {
            return "\(hours) hours \(minutes) minutes"
        } else if days == 0 && hours == 0 {
            return "\(minutes) minutes"
        } else {
            return "\(days) days \(hours) hours \(minutes) minutes"
        }
       
    }
  
    
    var body: some View {
        
     
        ZStack {
            Rectangle()
                .foregroundColor(Color(hex: "F0C43F"))
                .frame(height: 100)
                .cornerRadius(15)
            HStack {
                
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.body)
                        .bold()
                        //.padding(.bottom, 10)
                        .padding(.leading, 15)
                    
                    
                        Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                            .font(.footnote)
                            .padding(.leading, 15)
                        
                     
                        Text(calculateRemainingTime(from: Date(), to: dueDate) ?? "")
                            .font(.footnote)
                            .padding(.leading, 15)
                    
                    
                }
                Spacer()
                
                Button {
                    viewModel.toggleIsDone(item: item)
                } label: {
                    Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                }.padding(.trailing, 15)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "Gym",type: "Deadline" ,dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
