//
//  SwiftuiCryptoApp.swift
//  SwiftuiCrypto
//
//  Created by Abdelrahman Elsayed on 6/18/22.
//

import SwiftUI

@main
struct SwiftuiCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }.navigationBarHidden(true)
        }
    }
}
