//
//  HomeView.swift
//  SwiftuiCrypto
//
//  Created by Abdelrahman Elsayed on 6/18/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isProfileView = true
    
    var body: some View {
        
        ZStack {
            
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
               homeHeader
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
       
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
}
