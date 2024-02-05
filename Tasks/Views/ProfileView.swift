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
            ZStack {
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
        VStack (alignment: .center, spacing: 20) {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 125, height: 125)
                .padding(.top, 80)
            
            HStack {
                Text("\(user.firstname) \(user.lastname)")
                    .font(.system(.largeTitle))
            }
            
            HStack {
                Text("Joined:").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))").padding()
            }
            Divider()
            
            TDButton(buttontitle: "Log Out", background: .red, action: viewModel.logOut)
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}
