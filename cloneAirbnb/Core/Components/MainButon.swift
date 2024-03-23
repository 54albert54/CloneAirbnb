//
//  MainButon.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/23/24.
//

import SwiftUI

struct MainButon: View {
    var title:String
    var width:CGFloat?
    var action:()->Void
    var body: some View {
        Button {
            action()
            
        } label: {
            
            Text(title)
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: width ?? 360  ,height: 40)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    MainButon(title: "Prueba") {
        print("hola mundo")
    }
}
