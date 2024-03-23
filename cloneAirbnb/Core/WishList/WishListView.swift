//
//  WishListView.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/22/24.
//

import SwiftUI

struct WishListView: View {
    @EnvironmentObject var viewModel:ExplorerViewModel
    @State var isToLoging = false
    var body: some View {
        NavigationStack{
            ScrollView{
                // MARK: - Login 
                if let user =  viewModel.loginUser  {
                    UserPerfilCard(user: user)
                        .padding()
                    FavoriteList()
                    
                }else{
                    VStack{
                        VStack(alignment:.leading){
                            Text("Log in to view your wishlist")
                                .fontWeight(.semibold)
                            Text("You can crate, view or edit wishlists once you've logged in")
                                .font(.caption)
                            
                        }.frame(maxWidth:.infinity,alignment: .leading)
                            .padding()
                        Button {
                            isToLoging = true
                            
                        } label: {
                            
                            Text("Log in")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width:360  ,height: 40)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        
                    }
                    .sheet(isPresented: $isToLoging, content: {
                        LoginView()
                    })
                }
            }
            .navigationTitle("Wishlists")
            
            
        }
    }
}

#Preview {
    WishListView()
        .environmentObject(ExplorerViewModel(service: ExplorerService()))
}
