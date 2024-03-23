//
//  UserPerfilCard.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/23/24.
//

import SwiftUI
import Kingfisher

struct UserPerfilCard: View {
    var user:UserAuth
    var body: some View {
        HStack {
            KFImage(URL(string: user.img))
                .resizable()
                .frame(width: 64 , height: 64)
                .clipShape(Circle())
                .padding(.leading,40)
           
            VStack(alignment:.leading){
                Text(user.name)
                Text(user.lastName)
            }.padding(.leading,20)
                .foregroundStyle(.black)
            Spacer()
            
        }
        .modifier(ContentViewModifier())
            
    }
}

#Preview {
    UserPerfilCard(user: UserAuth.dummyUser).padding()
}
