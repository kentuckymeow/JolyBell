//
//  HomeModel.swift
//  JolyBell
//
//  Created by Arseni Khatsuk on 25.05.2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import UIKit

class HomeViewModel: ObservableObject {
    
    @Published var search = ""
    
    //MARK: - Functions for Authentication
    
    let authorization = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        
        return authorization.currentUser != nil
    }
    
    func signIn(email: String, password:String) {
        
        authorization.signIn(withEmail: email, password: password) { [weak self] result, error in
            
            guard result != nil,  error == nil else {
                return
            }
            
            // if we are here that means no error
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
        
    }
    
    
    func signUp(email:String, password:String ) {
        
        authorization.createUser(withEmail: email, password: password) { [weak self] result, error in
            
            guard result != nil,  error == nil else {
                return
            }
            
            // success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }

    }
    
    func signOut() {
        
        try? authorization.signOut()
        
        self.signedIn = false
    }
    
    //MARK: - function to fetch data
    
    @Published var items: [Item] = []
    
    func fetchData(){
        
        let db = Firestore.firestore()
        db.collection("Items").getDocuments {
            (snap,error) in
            guard let itemData = snap else{return}
            self.items = itemData.documents.compactMap({
                (doc) -> Item? in
                let id = doc.documentID
                let name = doc.get("item_name") as! String
                let cost = doc.get("item_cost") as! NSNumber
                let image = doc.get("item_image") as! String
                let details = doc.get("item_details") as! String
                
                return Item(id: id, item_name: name, item_cost: cost, item_details: details, item_image: image)
            })
            
        }
    }
    
    
}
