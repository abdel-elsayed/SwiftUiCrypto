//
//  HomeViewModel.swift
//  SwiftuiCrypto
//
//  Created by Abdelrahman Elsayed on 7/28/22.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portofolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portofolioCoins.append(DeveloperPreview.instance.coin)

        }
    }
}
