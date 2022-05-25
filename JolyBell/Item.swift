//
//  Item.swift
//  JolyBell
//
//  Created by Arseni Khatsuk on 26.05.2022.
//

import Foundation

struct Item: Identifiable {
    var id:String
    var item_name: String
    var item_cost: NSNumber
    var item_details: String
    var item_image:String
    var isAdded:Bool = false
    
}

