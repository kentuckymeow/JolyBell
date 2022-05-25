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
                
                return Item(id: id, item_name: name, item_cost: cost, item_details: details, item_image: image)})
            
            self.filtered = self.items
        }
    }
    
    @Published var filtered: [Item] = []
    
    func filterData(){
        
        self.filtered = self.items.filter{
            return
               $0.item_name.lowercased().contains(self.search.lowercased())
        }
    }
    
    //MARK: - cart functionality
        
        @Published var cartItems: [Cart] = []
        
        
        func addToCart(item: Item) {
            
            self.items[getIndex(item: item, isCartIndex: false)].isAdded = !item.isAdded
            self.filtered[getIndex(item: item, isCartIndex: false )].isAdded = !item.isAdded
            if item.isAdded {
                
                self.cartItems.remove(at: getIndex(item: item, isCartIndex: true))
                return
                
            }
            self.cartItems.append(Cart(item: item, quantity: 1))}
    
    //MARK: - index func
       
       func getIndex(item: Item, isCartIndex: Bool) -> Int {
           
           let index = self.items.firstIndex { (item1) -> Bool in
               
               return item.id == item1.id
           } ?? 0
           let cartIndex = self.cartItems.firstIndex {
               (item1) -> Bool in
               return item.id == item1.item.id
           } ?? 0
           
           return isCartIndex ? cartIndex : index
           
       }
    
    //MARK: - for our cart view
       
       
       func calculateTotalPrice() -> String {
       
       var price: Float = 0
       
       cartItems.forEach { (item) in
       
       price += Float(item.quantity) * Float(truncating: item.item.item_cost)
       }
       return getPrice(value: price)
       }
       
       func getPrice(value: Float) -> String {
           
           let format = NumberFormatter()
           format.numberStyle = .currency
           return format.string(from: NSNumber(value: value)) ?? ""
           
       }
    
}
