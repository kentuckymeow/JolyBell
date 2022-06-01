//
//  CartView.swift
//  JolyBell
//
//  Created by Arseni Khatsuk on 25.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartView: View {
    @ObservedObject var homeData: HomeViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack{
                HStack(spacing : 20){
                    Text("Корзина")
                        .font(.custom("Futura-Bold", size: 30))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
                ScrollView {
                    LazyVStack(spacing: 0){
                        ForEach(homeData.cartItems){
                            cart in
                            
                            HStack(spacing : 15){
                                WebImage(url: URL(string: cart.item.item_image))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(15)
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(cart.item.item_name)
                                        .font(.custom(FontsManager.newLight, size: 15))
                                        .foregroundColor(.gray)
                                        .lineLimit(2)
                                    HStack(spacing: 15){
                                        Text(homeData.getPrice(value: Float(truncating: cart.item.item_cost)))
                                            .font(.title2)
                                            .fontWeight(.heavy)
                                            .foregroundColor(.black)
                                        Spacer(minLength: 0)
                                        
                                        Button(action: {
                                            if cart.quantity > 1 {
                                                homeData.cartItems[homeData.getIndex(item: cart.item, isCartIndex: true)].quantity -= 1
                                            }}) {
                                                Image(systemName: "minus")
                                                    .font(.system(size: 16, weight: .heavy))
                                                .foregroundColor(.black)}
                                        Text("\(cart.quantity)")
                                            .fontWeight(.heavy)
                                            .foregroundColor(.black)
                                            .padding(.vertical, 5)
                                            .padding(.horizontal, 10)
                                            .background(Color.black.opacity(0.06))
                                        
                                        Button(action: {homeData.cartItems[homeData.getIndex(item: cart.item, isCartIndex: true)].quantity += 1})  {
                                            Image(systemName: "plus")
                                                .font(.system(size: 16, weight: .heavy))
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                            }
                            .padding()
                            .contentShape(RoundedRectangle(cornerRadius: 15))
                            Button(action: {
                                let index = homeData.getIndex(item: cart.item, isCartIndex: true)
                                let itemIndex = homeData.getIndex(item: cart.item, isCartIndex: false)
                                let filterIndex = homeData.filtered.firstIndex { (item1) -> Bool in
                                    return cart.item.id == item1.id} ?? 0
                                homeData.items[itemIndex].isAdded = false
                                homeData.filtered[filterIndex].isAdded = false
                                homeData.cartItems.remove(at: index)})  {
                                    Image(systemName: "trash")
                                        .renderingMode(.original)
                                }
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("ИТОГО:")
                                .font(.custom(FontsManager.newLight, size: 20))
                                .foregroundColor(.gray)
                            Spacer()
                            
                            Text(homeData.calculateTotalPrice())
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                        }
                        .padding([.top, .horizontal])
                        
                        
                        Button(action: homeData.updateOrder) {
                            Text(homeData.ordered ? "Отменить заказ" : "Заказать")
                                .font(.custom("Futura-Bold", size: 20))
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: 300)
                                .background(Color.black)
                                .cornerRadius(15)
                        }
                        
                    }
                    
                    
                }
                
                Text("Введите данные для доставки")
                    .font(.custom("Futura-Bold", size: 15))
                    .tracking(2)
                Form {
                    TextField("ИМЯ", text: $homeData.name)
                        .font(.custom(FontsManager.newLight, size: 15))
                    TextField("ФАМИЛИЯ", text: $homeData.secondName)
                        .font(.custom(FontsManager.newLight, size: 15))
                    TextField("ОТЧЕСТВО", text: $homeData.patronymic)
                        .font(.custom(FontsManager.newLight, size: 15))
                    TextField("СТРАНА", text: $homeData.country)
                        .font(.custom(FontsManager.newLight, size: 15))
                    TextField("ГОРОД", text: $homeData.city)
                        .font(.custom(FontsManager.newLight, size: 15))
                    TextField("ПОЧТОВЫЙ ИНДЕКС", text: $homeData.postcode)
                        .keyboardType(.numberPad)
                        .font(.custom(FontsManager.newLight, size: 15))
                    TextField("АДРЕС", text: $homeData.address)
                        .font(.custom(FontsManager.newLight, size: 15))
                    
                }
                
            }
       //.navigationBarItems(leading: Button(action: {presentationMode.wrappedValue.dismiss()}, label: { Image(systemName: "xmark")
          // }).accentColor(Color.black), trailing: EditButton())
            .navigationBarItems(leading: Button(action: {presentationMode.wrappedValue.dismiss()}, label: { Image(systemName: "xmark")
                      }).accentColor(Color.black))
            
        }
        
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(homeData: HomeViewModel())
    }
}
