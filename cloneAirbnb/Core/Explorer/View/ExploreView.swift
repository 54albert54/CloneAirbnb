//
//  ExploreView.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/20/24.
//

import SwiftUI


struct ExploreView: View {
   @State private var showSearchBarArea = false
    @EnvironmentObject var viewModel:ExplorerViewModel
    var body: some View {
        NavigationStack{
            if showSearchBarArea {
                DestinationSearchView(show: $showSearchBarArea )
            } else{
            
                
                ScrollView{
                    SearchAndFilterBar(location: viewModel.searchLocation)
                       
                        .onTapGesture {
                            withAnimation(.snappy){
                                showSearchBarArea.toggle()
                            }
                        
                        }
                    LazyVStack(spacing: 24){
                        ForEach(viewModel.listing ) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing:listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            .foregroundStyle(.secondary)
                          
                        }
                    }
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing:listing)
                        .navigationBarBackButtonHidden(true)
                }
              
            }
        }
    }
}

#Preview {
    ExploreView()
        .environmentObject(ExplorerViewModel(service: ExplorerService()))
}
