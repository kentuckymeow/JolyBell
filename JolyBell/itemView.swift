//
//  itemView.swift
//  JolyBell
//
//  Created by Arseni Khatsuk on 26.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct itemView: View {
    
    @StateObject var HomeModel = HomeViewModel()
    var item: Item
    
    var body: some View {
        VStack{
            
            WebImage(url: URL(string: item.item_image))
                .resizable()
                .frame(width: 250, height: 250)
                .aspectRatio(contentMode: .fit)
            
            VStack(spacing: 8){
                Text(item.item_name)
                    .font(.custom(FontsManager.newLight, size: 15))
                    .tracking(3)
                    .foregroundColor(.black)
                HStack{
                    Text("$\(item.item_cost)")
                        .font(.custom("Futura-Bold", size: 15))
                        .foregroundColor(.black)
                        
                                    }
                
                
            }
            
        }
    }
}


