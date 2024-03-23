//
//  ProfileOptionsRowView.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/22/24.
//

import SwiftUI

struct ProfileOptionsRowView: View {
    let imageIcon:String
    let title:String
    var body: some View {
        
        VStack {
            HStack{
                Image(systemName: imageIcon)
                Text(title)
                Spacer()
                Image(systemName: "chevron.right")
                
            }
            Divider()
        }
    }
}

#Preview {
    ProfileOptionsRowView(imageIcon: "gear", title: "Settings")
}
