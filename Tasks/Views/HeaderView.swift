//
//  HeaderView.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let background: Color
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(background)
                
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.custom("Basis Grotesque Arabic Pro", size: 20))
                    .bold()
                
                Text(subtitle.trimmingCharacters(in: .whitespaces))
                    .foregroundColor(.white)
                    .font(.custom("Basis Grotesque Arabic Pro", size: 40))
                    
                    
            }
            .padding(.top, 100)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "Titel", subtitle: "subtitle", background: .yellow)
}
