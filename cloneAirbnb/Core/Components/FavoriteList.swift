//
//  FavoriteList.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/23/24.
//

import SwiftUI
import Kingfisher

struct FavoriteList: View {
    @EnvironmentObject var viewModel:ExplorerViewModel
    
    var body: some View {
       
            VStack{
               
                ScrollView{
                    ForEach(viewModel.listingFavorite){ list in
                        
                        
                        NavigationLink(value: list) {
                            HStack(alignment: .top){
                                KFImage(URL(string: list.imagenUrls[0]))
                                    .resizable()
                                    .frame(width: 200,height: 100 )
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                Text(list.title).foregroundStyle(.secondary)
                                Spacer()
                            }
                            
                            
                            
                        }.padding()
                        
                            .navigationDestination(for: Listing.self) { listing in
                                ListingDetailView(listing:listing)
                                    .navigationBarBackButtonHidden(true)
                            }
                        
                    }
                
            }
        }
    }
}

#Preview {
    NavigationStack{
        FavoriteList()
            .environmentObject(ExplorerViewModel(service: ExplorerService()))
    }
}
