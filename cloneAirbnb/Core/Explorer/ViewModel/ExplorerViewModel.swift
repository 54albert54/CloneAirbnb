//
//  ExplorerViewModel.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/22/24.
//

import Foundation

class ExplorerViewModel:ObservableObject{
    @Published var listing = [Listing]()
    @Published var listingFavorite = [Listing]()
    @Published var searchLocation = ""
    @Published var loginUser:UserAuth?
    private let service: ExplorerService
    private var copylisting = [Listing]()
    
    
    init(service: ExplorerService){
        self.service =  service
        Task {   await fetchListing()}
    }
    
    func fetchListing()async{
        do{
            self.listing = try await service.fetchListing()
            self.copylisting = listing
        }catch{
            print("DEBUG: error \(error)")
        }
    }
    func updateListingForLocation(){
        let fileredListings = listing.filter {
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        }
        
        self.listing = fileredListings.isEmpty ? copylisting : fileredListings
    }
    func loginUser(name:String , password:String ,complete:@escaping((Bool)->Void)){
        if name.lowercased()  == "admin" ,
           password.lowercased() == "asdf"{
            loginUser = UserAuth.dummyUser
            print("YOu are in")
            complete(true)
        }else{
            complete(false)
        }
    }
    func checkFavorte(elemet:Listing) ->Bool{
        return listingFavorite.contains(where: { $0.id == elemet.id})
    }
    func addToFavorite(elemet:Listing){
        
        if !checkFavorte(elemet: elemet) {
            
            listingFavorite.append(elemet)
           
        }else{
            if let index  = listingFavorite.firstIndex(of: elemet) {
                listingFavorite.remove(at: index)
            }
            
        }
        print(listingFavorite.count)
        
    }
}
