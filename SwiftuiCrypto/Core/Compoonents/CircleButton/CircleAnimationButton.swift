//
//  CircleAnimationButton.swift
//  SwiftuiCrypto
//
//  Created by Abdelrahman Elsayed on 6/19/22.
//

import SwiftUI

struct CircleAnimationButton: View {
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeOut(duration: 1.0) : .none, value: animate)
//            .animation(animate ? .easeOut(duration: 1.0) : .none)
            .onAppear {
                animate.toggle()
            }
    }
}

struct CircleAnimationButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleAnimationButton(animate: .constant(false))
    }
}
