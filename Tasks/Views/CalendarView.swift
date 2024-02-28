//
//  CalendarView.swift
//  Tasks
//
//  Created by Luca Blanco Marchese on 27.02.24.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var viewModel = CalendarViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                Spacer()
                
            }.navigationTitle("Calendar")
        }
    }
}

#Preview {
    CalendarView()
}
