//
//  ListingDetailView.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/20/24.
//

import SwiftUI
import MapKit
import Kingfisher

struct ListingDetailView: View {
    let listing:Listing
    @State private var cameraPosition:MapCameraPosition
    @EnvironmentObject var viewModel:ExplorerViewModel
    @Environment(\.dismiss) var dismiss
    init(listing:Listing){
        self.listing = listing
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: listing.latitude , longitude: listing.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
      
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    
    
    
    

    

    var body: some View {
        ScrollView{
            ZStack(alignment:.topLeading){
                ImagenesCoruselView(allImages: listing.imagenUrls)
                    .frame(height: 320)
                HStack{
                    
                       
                }.frame(maxWidth: .infinity , alignment:.trailing)
                Button {
                    withAnimation(.snappy){
                        dismiss()
                    }
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.gray)
                        .background(
                        Circle()
                            .fill(.white)
                            .frame(width:32,height: 32)
                        ).padding(.horizontal,38)
                        .padding(.vertical,72)
                }

            }
               
            VStack{
                // MARK: - House view
                VStack(alignment:.leading,spacing: 8){
                    HStack {
                        Text(listing.title)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                        Spacer()
                        if let user = viewModel.loginUser {
                            Button(action: {
                                viewModel.addToFavorite(elemet: listing)
                                
                            }, label: {
                                Image(systemName: viewModel.checkFavorte(elemet: listing) ? "heart.fill" : "heart" )
                                    .foregroundStyle(.gray)
                            })
                        }
                       
                        
                            
                    }
                    VStack(alignment:.leading,spacing: 2){
                        HStack(spacing: 2){
                            Image(systemName: "star.fill")
                            Text("\(listing.rating)")
                            Text("-")
                            Text("28 review")
                                .underline()
                                .fontWeight(.semibold)
                        }
                        Text(listing.address)
                        
                    }
                    .font(.caption)
                    
                    
                    Divider()
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                .padding(.horizontal)
                // MARK: - user info
                VStack{
                    HStack{
                        VStack(alignment:.leading,spacing: 2){
                            Text("Entire villa hosted by")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text(listing.ownerName)
                                .fontWeight(.semibold)
                            HStack{
                                Text("\(listing.numberOfGuests) guests -")
                                Text("\(listing.numberorbedrooms) bedrooms -")
                                Text("\(listing.numberOfBeds) beds -")
                                Text("\(listing.numberorbathrooms) bath")
                            }
                            .font(.caption)
                            
                        }
                        Spacer()
                      
                        KFImage(URL(string: listing.ownerImageUrl))
                            .resizable()
                            .frame(width: 64 , height: 64)
                            .scaledToFill()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                    }
                    
                    Divider()
                }
                .padding()
                // MARK: - feaatures
                VStack(alignment:.leading , spacing: 16){
                    ForEach(listing.features){ feature in
                        HStack(alignment:.top ,spacing: 12 ){
                            Image(systemName: feature.imageName)
                            VStack(alignment: .leading ,spacing: 4){
                                Text(feature.title)
                                    .fontWeight(.semibold)
                                    .offset(y:-3)
                                Text(feature.subtitle)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .padding(.horizontal)
                        
                    }
                    
                    Divider()
                }
                // MARK: - rooms
                VStack (alignment: .leading, spacing: 12 ){
                    Text("Where you'll  sleep")
                        .font(.headline)
                        .padding(.leading)
                    ScrollView(.horizontal ,showsIndicators: false) {
                        HStack{
                            ForEach(1 ... listing.numberorbedrooms , id:\.self){ roon in
                                Button {
                                    
                                } label: {
                                    VStack(alignment:.leading){
                                        Image(systemName: "bed.double")
                                        Text("Bedroon \(roon)")
                                    }.foregroundStyle(.black)
                                        .padding()
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                                .foregroundStyle(Color(.systemGray2))
                                                .shadow(color:.black.opacity(0.4),radius: 10)
                                        }
                                    
                                }
                                .padding(.leading)
                                
                            }
                        }
                        Divider()
                    }
                    .scrollTargetBehavior(.paging)
                    
                    
                } .padding(.vertical)
                // MARK: - offers
                VStack(alignment:.leading ,spacing: 16){
                    Text("what this place offers")
                        .font(.headline)
                    
                    ForEach(listing.amenities , id:\.self ){ service in
                        HStack{
                            Image(systemName:service.imageName)
                            Text(service.title).fontWeight(.medium)
                        }
                        
                    }
                    Divider().padding(.bottom)
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 10.0)
                
                // MARK: - map
                VStack(alignment:.leading){
                    Text("Where you'll be")
                        .font(.headline)
                    Map(position: $cameraPosition)
                        .frame(height: 320)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }.padding()
               
            }
           
                     
        }
        .toolbar(.hidden, for: .tabBar)
        .padding(.bottom, 104)
        .ignoresSafeArea()
        .overlay(alignment:.bottom) {
            VStack{
               
                Divider().padding(.bottom)
                HStack{
                    VStack(alignment:.leading){
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("total Before taxex")
                            .font(.caption)
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .underline()
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    Button {
                        withAnimation(.snappy){
                            dismiss()
                        }
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width:140,height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                }.padding(.horizontal, 32)
            }.background(.white)
            
            
        }
        
    }
}

#Preview {
    ListingDetailView(listing:DeveloperProvider.shared.listings[0])
        .environmentObject(ExplorerViewModel(service: ExplorerService()))
}
