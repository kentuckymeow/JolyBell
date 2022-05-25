//
//  Menu.swift
//  JolyBell
//
//  Created by Arseni Khatsuk on 25.05.2022.
//

import SwiftUI

struct Menu: View {
    @StateObject var  HomeModel = HomeViewModel()
    @State private var showingCartScreen = false
    var body: some View {
        NavigationView{
        VStack{
            Spacer()
                .frame( height: 40)
            HStack(spacing: 15){
                TextField("Search",text:$HomeModel.search)
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
                Spacer()
                    .frame(width:40)
                
            }
            .padding(.horizontal)
            .padding(.top , 10)
            Divider()
                .frame(width: 325)
                .padding(.trailing, 60)
            Spacer()
            
            ScrollView {
                
                VStack(spacing: 25){
                    ForEach(HomeModel.items) { item in
                        Text(item.item_name)
                    }
                    
                }
            }
            
        .ignoresSafeArea()
        .navigationBarItems(trailing: Button(action: {self.showingCartScreen.toggle()}, label: {
            Image(systemName: "cart")
                .renderingMode(.original)
                .font(.system(size: 20))}))
        .sheet(isPresented: $showingCartScreen,content: {
            CartView(homeDate: HomeModel)})
            
        }
        .ignoresSafeArea()
        .accentColor(Color.black)
        .onAppear(perform: {
            self.HomeModel.fetchData()
        })
        }
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
