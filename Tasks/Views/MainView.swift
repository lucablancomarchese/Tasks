//
//  ContentView.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 04.01.24.
//""
import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
   
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserID).tabItem {
                Label("Tasks", systemImage: "checklist")
            }
            CalendarView().tabItem {
                Label("Calendar", systemImage: "calendar.circle")
            }
            ProfileView().tabItem {
                Label("Profile", systemImage: "person.circle")
            }
            
            
        }
    }
}

#Preview {
    MainView()
}
