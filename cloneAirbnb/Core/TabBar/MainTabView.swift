//
//  MainTabView.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/22/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem { Label("Explorer" ,systemImage: "magnifyingglass") }
            
            WishListView()
                .tabItem { Label("Wishlists" ,systemImage: "heart") }
            
            ProfileView()
                .tabItem { Label("Profile" ,systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView()
}
