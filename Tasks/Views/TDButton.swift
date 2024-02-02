//
//  TDButton.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 06.01.24.
//

import SwiftUI

struct TDButton: View {
    let buttontitle: String
    let background: Color
    let action: () -> Void
    var body: some View {
        
            Button {
                action()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(background)
                        .frame(width: 300, height: 50)
                    
                    Text(buttontitle)
                        .foregroundColor(Color.white)
                        .bold()
                    
                }
            }
            
        
    }
}

#Preview {
    TDButton(buttontitle: "Title", background: .blue) {
        //action
    }
}
