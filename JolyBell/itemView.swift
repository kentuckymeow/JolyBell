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
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                HStack{
                    Text("RUB \(item.item_cost)")
                        .font(.caption)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    //Spacer()
                }
                
                
            }
            
        }
    }
}

//struct itemView_Previews: PreviewProvider {
//    static var previews: some View {
//        itemView()
//    }
//}
