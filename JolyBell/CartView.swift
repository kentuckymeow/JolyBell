//
//  CartView.swift
//  JolyBell
//
//  Created by Arseni Khatsuk on 25.05.2022.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var homeDate: HomeViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack{
            Text("ss")
            }
                .navigationBarItems(leading: Button(action: {presentationMode.wrappedValue.dismiss()}, label: { Image(systemName: "xmark")
                }), trailing: EditButton())
            
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(homeDate: HomeViewModel())
    }
}
