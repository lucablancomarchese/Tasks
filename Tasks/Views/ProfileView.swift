//
//  ProfileView.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading User...")
                }
            }
            .navigationTitle("Profile")
            
        }.onAppear{viewModel.fetchUser()}
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 125, height: 125)
        
        HStack {
            Text("First Name:").bold()
            Text(user.firstname).padding()
        }
        HStack {
            Text("Last Name:").bold()
            Text(user.lastname).padding()
        }
        HStack {
            Text("Joined:").bold()
            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))").padding()
        }
        
        Button("Log Out") {viewModel.logOut()}.foregroundColor(.red).padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
