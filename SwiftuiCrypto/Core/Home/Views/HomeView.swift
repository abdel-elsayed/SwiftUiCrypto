//
//  HomeView.swift
//  SwiftuiCrypto
//
//  Created by Abdelrahman Elsayed on 6/18/22
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var isProfileView = true
    
    var body: some View {
        ZStack {
            
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
               homeHeader
                
               columnTitles
                
                if !isProfileView {
                    allCoinsList
                    .transition(AnyTransition.asymmetric(insertion: .move(edge: .leading),
                                                         removal: .move(edge: .trailing)))
                } else {
                    portofolioList
                    .transition(AnyTransition.asymmetric(insertion: .move(edge: .trailing),
                                                         removal: .move(edge: .leading)))
                }
              
                Spacer(minLength: 0)
            }.animation(.easeIn, value: isProfileView)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
       
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleViewButton(iconName: isProfileView ? "plus" :"info")
                .background(
                    CircleAnimationButton(animate: $isProfileView)
                )
                .onTapGesture {
                     
                }
            
            Spacer()
            
            Text(isProfileView ?  "Pesonal Account" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
            
            Spacer()
            
            CircleViewButton(iconName: "chevron.right")
                .onTapGesture {
                    isProfileView.toggle()
                }.rotationEffect(Angle(degrees: isProfileView ? 180 : 0 ))
        }
        .padding()
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin,
                            showHoldingColumn: false)
                .listRowInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portofolioList: some View {
        List {
            ForEach(vm.portofolioCoins) { coin in
                CoinRowView(coin: coin,
                            showHoldingColumn: false)
                .listRowInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coins")
            Spacer()
            
            if isProfileView {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
