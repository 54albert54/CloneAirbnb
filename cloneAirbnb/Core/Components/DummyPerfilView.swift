//
//  DummyPerfilView.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/23/24.
//

import SwiftUI
import Kingfisher

struct DummyPerfilView: View {
    @EnvironmentObject var viewModel:ExplorerViewModel
    
    var user = UserAuth.dummyUser
    var body: some View {
        ZStack (alignment:.bottom){
           Color.gray
            KFImage(URL(string:user.img))
                .resizable()
                .frame(width: 172 ,height: 172)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .offset(y:-531)
            VStack(){
                KFImage(URL(string:user.img))
                    .resizable()
                    .frame(width: 172 ,height: 172)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .offset(y:-102)
                
               
                
                Spacer()
            }
            
            .frame(width: 390 ,height: 600)
            .background(.white)
            .clipShape(
            RoundedRectangle(cornerRadius: 45.0)
            )
            
            
//            .overlay(
//                RoundedRectangle(cornerRadius: 15.0)
//                    .foregroundStyle(.white.opacity(0.5))
//                    
//                    
//                    
//            )
            
            
        }
        
        .ignoresSafeArea()
    }
}

#Preview {
    DummyPerfilView()
        .environmentObject(ExplorerViewModel(service: ExplorerService()))
}
