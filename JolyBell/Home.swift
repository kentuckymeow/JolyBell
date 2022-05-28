//
//  Home.swift
//  JolyBell
//
//  Created by Arseni Khatsuk on 25.05.2022.
//

import SwiftUI
import FirebaseAuth

struct Home: View {
    @EnvironmentObject var viewModel:HomeViewModel
    @State private var showingMenuView = false
    
    var body: some View {
        VStack(spacing: 20){
            if viewModel.signedIn {
            Image("slide")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250,alignment: .top)
            Image("phrase")
                .resizable()
                .scaledToFit()
                .padding()
                .frame( alignment: .top)
            Spacer()
                
                Button(action: {self.showingMenuView.toggle()}, label: {
                    Text("МЕНЮ")
                        .font(.custom(FontsManager.newBook, size: 17))
                        .foregroundColor(.white)
                        .padding()
                        .clipShape(Rectangle())
                        .frame(width: 400,alignment: .center)
                        .background(Color.black)
                        .cornerRadius(45)
                       // .padding()
                })
                    .sheet(isPresented: $showingMenuView, content: {
                        Menu()
                        
                    })
                   // .padding()
                Button(action: {viewModel.signOut()}, label: {
                    Text("ВЫХОД")
                        .font(.custom(FontsManager.newBook, size: 17))
                        .foregroundColor(.white)
                       // .padding()
                        .clipShape(Rectangle())
                        .frame(width: 300, height: 50, alignment: .center)
                        .background(Color.black)
                        .cornerRadius(45)
                        .padding()
                })
                
            }
            
            else {
               SigningIn()
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct SigningIn: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var showingRegesterView = false
    
    var body: some View {
        
        VStack {
            
          Text("АВТОРИЗАЦИЯ")
                .font(.custom(FontsManager.newDemi, size: 30))
                .fontWeight(.bold)
                
                .padding()
            
          Text("ЭЛ.ПОЧТА")
                .font(.custom(FontsManager.newLight, size: 12))
                //.fontWeight(.medium)
                //.padding()
          TextField("введите свою почту",text: $email)
                .font(.custom(FontsManager.newLight, size: 15))
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .frame(height: 55)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 7)
               // .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
               // .padding([.horizontal], 24)
                
                .padding()
            
          Text("ПАРОЛЬ")
                .font(.custom(FontsManager.newLight, size: 12))
                //.padding()
          SecureField("введите свой пароль",text: $password)
                .font(.custom(FontsManager.newLight, size: 15))
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .frame(height: 55)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 7)
               // .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
               // .padding([.horizontal], 24)
               
                .padding()
            
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else{return}
                viewModel.signIn(email: email, password: password)
            }, label: {
                Text("ВОЙТИ")
                    .font(.custom(FontsManager.newBook, size: 17))
                    .padding()
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                    .frame(width: 250)
                    .background(Color.black)
                    .cornerRadius(45)
            })
            
            Button(action: {self.showingRegesterView.toggle()}, label: {
                Text("БЫСТРАЯ РЕГИСТРАЦИЯ")
                    .font(.custom(FontsManager.newBook, size: 17))
                    .foregroundColor(.white)
                    .padding()
                    .clipShape(Rectangle())
                    .frame(width: 400)
                    .background(Color.black)
                    .cornerRadius(45)
                    .padding()
                    
                
            })
                .sheet(isPresented: $showingRegesterView, content: {
                   SigningUp()
                })
            
               Spacer()
        
                 
            
            
            
        }
        
    }
    
    
    
}

struct SigningUp: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        
        VStack{
           Text("РЕГИСТРАЦИЯ")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding()
            
            Text("ПОЧТА")
                .font(.caption)
                .fontWeight(.medium)
            
            TextField("введите свою почту", text: $email)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
            
            Text("ПАРОЛЬ")
                .font(.caption)
                .fontWeight(.medium)
            
            SecureField("введите свой пароль", text: $password)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
            
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else {return}
                viewModel.signUp(email: email, password: password)
            }, label: {
                Text("ЗАРЕГИСТРИРОВАТЬСЯ")
                    .padding()
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                    .frame(width: 350)
                    .background(Color.black)
                    .cornerRadius(45)
                
            })
            
            Spacer()
            
            
            
            
            
            
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
