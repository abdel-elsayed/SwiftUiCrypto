//
//  CircleViewButton.swift
//  SwiftuiCrypto
//
//  Created by Abdelrahman Elsayed on 6/18/22.
//

import SwiftUI

struct CircleViewButton: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(color: .theme.accent.opacity(0.25),
                    radius: 10,
                    x: 0,
                    y: 0)
            .padding()
    }
}

struct CircleViewButton_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            
            CircleViewButton(iconName: "heart.fill")
                .previewLayout(.sizeThatFits)
            
            CircleViewButton(iconName: "heart.fill")
                .previewLayout(.sizeThatFits)
                .colorScheme(.dark)
        }
    }
}
