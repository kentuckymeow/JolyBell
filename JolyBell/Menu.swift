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
   //         Spacer()
   //             .frame( height: 40)
            HStack(spacing: 15){
                TextField("Search",text: $HomeModel.search)
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
                
                VStack{
                    ForEach(HomeModel.filtered) { item in
                        itemView(item: item)
                    }
                    
                }
            }
            
       // .ignoresSafeArea()
            .navigationBarTitle("Joly.Bell Collections'22")
        .navigationBarItems(trailing: Button(action: {self.showingCartScreen.toggle()}, label: {
            Image(systemName: "cart")
                .renderingMode(.original)
                .font(.system(size: 20))}))
        .sheet(isPresented: $showingCartScreen,content: {
            CartView(homeDate: HomeModel)})
            
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
