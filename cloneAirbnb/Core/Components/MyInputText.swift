//
//  MyInputText.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/23/24.
//

import SwiftUI

struct MyInputText: View {
    var placeHolder:String
    @Binding var input:String
    var isSafe:Bool?
    var body: some View {
        ZStack{
            if isSafe ?? false {
               SecureField("", text: $input)
                    .padding(.leading)
            }else{
                TextField("", text: $input)
                    .padding(.leading)
                
            }

            Text(placeHolder)
                .foregroundStyle( input.isEmpty ? .gray : .black)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , alignment: .leading)
                .offset(y: input.isEmpty ? 0 : -22)
            
                .animation(.easeInOut, value: input.isEmpty)
                .font(.caption2)
                .padding(8)
                .padding(.leading)
                .overlay(RoundedRectangle(cornerRadius: 16.0)
                    .stroke(Color(.black), lineWidth: 2.0)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 10)
                )
        }
    }
}


#Preview {
    MyInputText(placeHolder: "pueba", input: .constant("")).padding()
}
