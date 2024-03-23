//
//  ExplorerService.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/22/24.
//

import Foundation

class ExplorerService{
    func fetchListing() async throws ->[Listing]{
        return DeveloperProvider.shared.listings
    }
}
