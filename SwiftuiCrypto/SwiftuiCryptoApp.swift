//
//  SwiftuiCryptoApp.swift
//  SwiftuiCrypto
//
//  Created by Abdelrahman Elsayed on 6/18/22.
//

import SwiftUI

@main
struct SwiftuiCryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
