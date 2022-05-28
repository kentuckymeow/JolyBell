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
    
    init() {
            
           
            // 2.
            UINavigationBar.appearance().largeTitleTextAttributes = [
                //.foregroundColor: UIColor.darkGray,
                .font : UIFont(name:"Futura-Bold", size: 30)!]
                    
            // 3.
           
        }
    
    var body: some View {
        NavigationView{
        VStack{
   //         Spacer()
   //             .frame( height: 40)
            HStack(spacing: 50){
                TextField("Поиск",text: $HomeModel.search)
                    .font(.custom(FontsManager.newLight, size: 15))
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .frame(width: 40)
                //Spacer()
                    
                
            }
            .padding(.horizontal)
            .padding(.top , 10)
            Divider()
                .frame(width: 325)
                .padding(.trailing, 60)
            Spacer()
            Spacer()
            
            ScrollView {
                
                VStack{
                    ForEach(HomeModel.filtered) { item in
                        itemView(item: item)
                        Button(action: {HomeModel.addToCart(item: item)}, label: {
                        Image(systemName: item.isAdded ? "cart.badge.minus" : "cart.badge.plus")
                        .renderingMode(.original)
                    })
                                            
                    }
                    
                }
            }
            
       // .ignoresSafeArea()
            .navigationBarTitle("Каталог")
        .navigationBarItems(trailing: Button(action: {self.showingCartScreen.toggle()}, label: {
            Image(systemName: "cart")
                .renderingMode(.original)
                .font(.system(size: 20))}))
        .sheet(isPresented: $showingCartScreen,content: {
            CartView(homeData: HomeModel)})
            
            
            
        }
        //.ignoresSafeArea()
        .accentColor(Color.black)
        .onAppear(perform: {
            self.HomeModel.fetchData()
        })
            
        .onChange(of: HomeModel.search, perform: { value in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                if value == HomeModel.search && HomeModel.search != ""{
                    //search the date
                    HomeModel.filterData()
                }
            }
            if  HomeModel.search == "" {
                // we need to reset all data
                
                withAnimation(.linear) {
                    
                    HomeModel.filtered = HomeModel.items}}})}
        
    }
}



struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
