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
            VStack (alignment: .leading) {
                HStack {
                    
                    Text(title)
                        .foregroundColor(.black)
                        
                }
                .padding(.leading, -150.0)
                
                HStack {
                    Text(subtitle.trimmingCharacters(in: .whitespaces))
                        .foregroundColor(.black)
                        .bold()
                        .font(.system(size: 50))
                        
                    
                        
                }
                .padding(.leading, -150.0)
               
            }
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "Titel", subtitle: "subtitle", background: .yellow)
}
