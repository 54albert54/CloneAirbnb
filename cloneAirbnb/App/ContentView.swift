//
//  ContentView.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ExplorerViewModel(service: ExplorerService())
    
    var body: some View {
        MainTabView()
            .environmentObject(ExplorerViewModel(service: ExplorerService()))
    }
}

#Preview {
    ContentView()
        .environmentObject(ExplorerViewModel(service: ExplorerService()))
}
