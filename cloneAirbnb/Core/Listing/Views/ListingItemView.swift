//
//  ListingItemsView.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/20/24.
//

import SwiftUI

struct ListingItemView: View {
    var listing :Listing
 
    var body: some View {
        VStack{
            ImagenesCoruselView(allImages: listing.imagenUrls )
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            
            HStack(alignment: .top){
                VStack(alignment:.leading){
                    Text(listing.title)
                        .fontWeight(.semibold)
                    Text(listing.address)
                        .foregroundStyle(.gray)
                    Text("Nov 3 -10")
                        .foregroundStyle(.gray)
                    HStack{
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                Spacer()
                HStack{
                    Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                }
            }
            .font(.footnote) //chage the font for all coumponents
            
            
            
        }.padding()
            .foregroundStyle(.primary)
    }
}
#Preview {
    ListingItemView(listing: DeveloperProvider.shared.listings[0])
}
