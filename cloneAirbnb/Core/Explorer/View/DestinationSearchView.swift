//
//  DestinationSearchView.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/21/24.
//

import SwiftUI

enum DestinationOption {
    case location , dateReserve , guests
}

struct DestinationSearchView:View {
    @Binding var show:Bool
    @EnvironmentObject var viewModel:ExplorerViewModel
    @State var startDate = Date()
    @State var endDate = Date()
    @State var allGests = 1
    @State var destinationOptionSelected:DestinationOption = .location

    
    var body: some View {
        VStack{
            
            HStack{
                Button {
                    viewModel.updateListingForLocation()
                    show.toggle()
                   
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.gray)
                    
                }
                Spacer()
                if viewModel.searchLocation.isEmpty {
                    EmptyView()
                }else{
                    
                    Text("Clear")
                        .onTapGesture {
                            viewModel.searchLocation = ""
                            viewModel.updateListingForLocation()
                        }
                }
            }.padding(.bottom)
            // MARK: - where to?
            VStack{
                if destinationOptionSelected == .location{
                    VStack(alignment:.leading){
                        Text( "Where to?")
                            .font(.title2)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                                .foregroundStyle(.black)
                            TextField("Search destinations", text: $viewModel.searchLocation)
                                .foregroundStyle(.gray)
                                .onSubmit {
                                    
                                    viewModel.updateListingForLocation()
                                    show.toggle()
                                }
                        }
                        .padding(.horizontal)
                        .frame(height: 44)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.gray)
                        }
                        
                    }
                    
                }else{
                    CollapsedPickerView(title: "Where", description: "Add destination")
                    
                }
            }
            .modifier(ContentViewModifier())
            .onTapGesture {
                withAnimation(.snappy) { destinationOptionSelected = .location}
            }
            
            
            
            // MARK: - when to?
            VStack{
                if destinationOptionSelected == .dateReserve{
                    VStack(alignment:.leading){
                        Text("Where to?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                           
                        VStack(spacing:20){
                            DatePicker("From", selection: $startDate, displayedComponents: .date)
                                .foregroundStyle(.black)
                            Divider()
                            DatePicker("To", selection: $endDate, displayedComponents: .date)
                                .foregroundStyle(.black)
                        }
                        
                        
                    }
                    
                }else{
                    CollapsedPickerView(title: "When", description: "Add date")
                    
                }
            }
            .modifier(ContentViewModifier())
            .onTapGesture {
                withAnimation(.snappy) { destinationOptionSelected = .dateReserve}
            }
            
            // MARK: - who to?
            VStack{
                if destinationOptionSelected == .guests{
                    VStack(alignment:.leading){
                        Text("Who's comming?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        HStack(spacing:1){
                            Text("\(allGests) Adults")
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                            Spacer()
                            HStack{
                                Button(action: {
                                    if allGests > 1 {
                                        allGests -= 1
                                    }
                                }, label: {
                                    Text("-")
                                        .padding(.horizontal)
                                        .frame(height: 32)
                                        .foregroundStyle(.black)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                                .foregroundStyle(.gray)
                                        }
                                })
                                Button(action: {
                                    if allGests < 10 {
                                        allGests += 1
                                    }
                                }, label: {
                                    Text("+")
                                        .padding(.horizontal)
                                        .frame(height: 32)
                                        .foregroundStyle(.black)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                                .foregroundStyle(.gray)
                                        }
                                })
                            }
                        }
                        
                        .frame(height: 44)
                        
                        
                    }
                    
                }else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                    
                }
            }
            .modifier(ContentViewModifier())
            .onTapGesture {
                withAnimation(.snappy) { destinationOptionSelected = .guests}
            }
            
            
            
            
            
            
            
            
            Spacer()
            
            
            
        }
        .padding(.horizontal)
        
        
        
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
        .environmentObject(ExplorerViewModel(service: ExplorerService()))
}
struct ContentViewModifier:ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
    }
    
}



struct CollapsedPickerView:View {
    let title:String
    let description:String
    var body: some View{
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
                    .foregroundStyle(.black)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
        
        
    }
}
