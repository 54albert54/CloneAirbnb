//
//  ProfileView.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/22/24.
//

import SwiftUI

struct ProfileView: View {
    @State var isToLoging = false
    @State var userEdit = false
    @EnvironmentObject var viewModel:ExplorerViewModel
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading) {
                
               
                if let user =  viewModel.loginUser  {
                    UserPerfilCard(user: user)
                        .padding(.top,40)
                    // MARK: - Optinos
                    List{
                        ProfileOptionsRowView(imageIcon: "gear", title: "Settings")
                            .onTapGesture {
                                userEdit = true
                            }
                        ProfileOptionsRowView(imageIcon: "gear", title: "Accessibility")
                        ProfileOptionsRowView(imageIcon: "questionmark.circle", title: "Visit the help center")
                        
                        
                        
                        
                    }.padding(.vertical)
                        .navigationDestination(isPresented: $userEdit, destination: {
                           DummyPerfilView()
                        })
//                        .sheet(isPresented: $userEdit, content: {
//                            Text("Editar")
//                        })
                       
                    Spacer()
                    
                }else{
                    // MARK: - loging
                    VStack(alignment:.leading ,spacing: 8) {
                        Text("Log in")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        
                        Text("Log in to start planning your next trip.")
                            .offset(y:-8)
                        
                        
                        Button {
                            withAnimation(.snappy){
                                isToLoging = true
                            }
                            
                        } label: {
                            
                            Text("Log in")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width:360  ,height: 40)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        
                        // MARK: - Sign up
                        HStack {
                            Text("Don't have an account? ")
                            Text("Sign up")
                                .fontWeight(.semibold)
                                .underline()
                            Spacer()
                        }.padding(.vertical , 8)
                            .font(.caption)
                        
                        Spacer()
                    }
                    
                    .sheet(isPresented: $isToLoging, content: {
                        LoginView()
                    })
                }

            }.padding(.horizontal)
                .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(ExplorerViewModel(service: ExplorerService()))

}


