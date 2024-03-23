//
//  SearchAndFilterBar.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/20/24.
//

import SwiftUI

struct SearchAndFilterBar: View {
     var location:String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            VStack(alignment:.leading, spacing: 2){
                Text("\(location.isEmpty ? "Where to?" : location)")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("\(location.isEmpty ? "Anywhare  - " : "")Any Week - add guest")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Button(action: {}, label: {
                Image(systemName:"line.3.horizontal.decrease.circle")
                    .foregroundStyle(.gray)
                
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color(.systemGray2))
                .shadow(color:.black.opacity(0.4),radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(location: "")
}
