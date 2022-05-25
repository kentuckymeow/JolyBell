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
    
    
}
