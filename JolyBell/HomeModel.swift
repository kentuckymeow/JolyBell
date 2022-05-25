//
//  HomeModel.swift
//  JolyBell
//
//  Created by Arseni Khatsuk on 25.05.2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class HomeViewModel: ObservableObject {
    
    @Published var search = ""
}
