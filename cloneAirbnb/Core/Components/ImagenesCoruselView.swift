//
//  ImagenesCoruselView.swift
//  cloneAirbnb
//
//  Created by Angel alberto Bernechea on 3/20/24.
//

import SwiftUI
import Kingfisher


struct ImagenesCoruselView: View {
    var allImages:[String]
    var body: some View {
        TabView{
            ForEach(allImages , id:\.self){ imagen in
                KFImage(URL(string: imagen))
                    .resizable()
                    .scaledToFill()
                
                
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ImagenesCoruselView(allImages:[
        "https://a0.muscache.com/im/pictures/miso/Hosting-942642536613029684/original/f866bcc7-63b2-49ad-9659-01a2aaa5203e.jpeg?im_w=1200",
        "https://a0.muscache.com/im/pictures/miso/Hosting-942642536613029684/original/13a5b212-63d7-4797-b1b4-0cae51465c49.jpeg?im_w=720",
        "https://a0.muscache.com/im/pictures/miso/Hosting-942642536613029684/original/c1aaaec1-302b-4e68-8df9-397b4a3e1fcf.jpeg?im_w=720",
        "https://a0.muscache.com/im/pictures/miso/Hosting-942642536613029684/original/a0d7b7cb-bd58-4657-b3f2-ab2b35ddf5f6.jpeg?im_w=720",
     
        ])
        .frame(height: 320)
}
