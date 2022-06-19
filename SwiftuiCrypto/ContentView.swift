//
//  ContentView.swift
//  SwiftuiCrypto
//
//  Created by Abdelrahman Elsayed on 6/18/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("AccentColor")
                    .foregroundColor(.theme.red)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
