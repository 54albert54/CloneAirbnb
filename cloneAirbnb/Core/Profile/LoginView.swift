//
//  LoginView.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/23/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel:ExplorerViewModel
    @State var userName = ""
    @State var password = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack (spacing:32){
            Text("Log in")
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , alignment: .leading)

            VStack(spacing:16){

                    MyInputText(placeHolder: "User Name", input: $userName)
                    MyInputText(placeHolder: "Password", input: $password,isSafe: true)
            }
            
            MainButon(title: "Log in") {
                viewModel.loginUser(name: userName, password: password){ result in
                    if result{
                        dismiss()
                    }
                }
            }
            
        }.padding()
        Spacer()
    }
}

#Preview {
    LoginView()
        .environmentObject(ExplorerViewModel(service: ExplorerService()))
  
}



