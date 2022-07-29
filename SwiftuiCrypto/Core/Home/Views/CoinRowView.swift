//
//  CoinRowView.swift
//  SwiftuiCrypto
//
//  Created by Abdelrahman Elsayed on 7/3/22.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            descriptionColumn
            
            Spacer()
            
            if showHoldingColumn {
                currentHoldingsColumn
            }
            
            currentCoinPrice
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin,
                    showHoldingColumn: true)
    }
}

extension CoinRowView {
    private var descriptionColumn: some View {
        HStack() {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(.theme.accent)
        }
    }
    
    private var currentHoldingsColumn: some View {
        VStack {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
                .foregroundColor(.theme.accent)
            
            Text((coin.currentHoldings ?? 0).asPercentString())
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green : Color.theme.red)
        }
    }
    
    private var currentCoinPrice: some View {
        VStack(alignment: .trailing) {
            Text("\(coin.currentPrice.asCurrencyWith6Decimals())")
                .bold()
                .foregroundColor(.theme.accent)
            
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green : Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        
    }
}
