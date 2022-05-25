//
//  CartModel.swift
//  JolyBell
//
//  Created by Arseni Khatsuk on 26.05.2022.
//

import SwiftUI

struct Cart: Identifiable {
    
    var id = UUID().uuidString
    var item: Item
    var quantity: Int
    
    
}
