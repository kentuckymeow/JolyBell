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
                        .tracking(2)
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
                        .tracking(2)
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
    

    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @State var alert = false
    @State var error = ""
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var showingRegesterView = false
    
    var body: some View {
        
//        ZStack{
//
//        VStack {
//
//          Text("АВТОРИЗАЦИЯ")
//                .font(.custom(FontsManager.newDemi, size: 30))
//                .tracking(2)
//                //.fontWeight(.bold)
//
//                .padding()
//
//          Text("ЭЛ.ПОЧТА")
//                .font(.custom(FontsManager.newLight, size: 12))
//                .tracking(2)
//                //.fontWeight(.medium)
//                //.padding()
//          TextField("",text: $email)
//                .font(.custom(FontsManager.newLight, size: 15))
//                 .disableAutocorrection(true)
////                .autocapitalization(.none)
////                //.frame(height: 55)
////                .textFieldStyle(PlainTextFieldStyle())
////                //.padding([.horizontal], 7)
////               // .cornerRadius(16)
////                //.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
////                .background(RoundedRectangle(cornerRadius: 16).stroke(self.password != "" ? Color("Color") : self.color,lineWidth: 2))
////               // .padding([.horizontal], 24)
//                .autocapitalization(.none)
//                .padding()
//                .frame(width:370)
//                .background(RoundedRectangle(cornerRadius: 16).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
//                //.padding(.top, 25)
//
//                .padding()
//
//          Text("ПАРОЛЬ")
//                .font(.custom(FontsManager.newLight, size: 12))
//                .tracking(2)
//                //.padding(.bottom,15)
//
//            HStack(spacing: 15){
//                VStack{
//
//                    if self.visible{
//
//                        TextField("", text: self.$password)
//                        .font(.custom(FontsManager.newLight, size: 15))
//                        .autocapitalization(.none)
//                        .disableAutocorrection(true)
//                    }
//                    else{
//
//                        SecureField("", text: self.$password)
//                        .font(.custom(FontsManager.newLight, size: 15))
//                        .autocapitalization(.none)
//                        .disableAutocorrection(true)
//                    }
//                }
//                Button(action: {
//
//                    self.visible.toggle()
//
//                }) {
//
//                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
//                        .foregroundColor(self.color)
//                }
//            }
//            .padding()
//            .frame(width:370)
//            .background(RoundedRectangle(cornerRadius: 16).stroke(self.password != "" ? Color("Color") : self.color,lineWidth: 2))
//           .padding(.top,15 )
//
//            HStack{
//
//                Spacer()
//
//                Button(action: {
//
//                   // self.reset()
//
//                }) {
//
//                    Text("Забыли пароль?")
//                        .font(.custom(FontsManager.newLight, size: 15))
//                        .tracking(2)
//                        .underline()
//                        .foregroundColor(Color("Color"))
//                        .opacity(0.5)
//                        .padding(.trailing,16)
//                }
//            }
//            .padding(.top, 20)
//
//
//
////          SecureField("введите свой пароль",text: $password)
////                .font(.custom(FontsManager.newLight, size: 15))
////                .disableAutocorrection(true)
////                .autocapitalization(.none)
////                .frame(height: 55)
////                .textFieldStyle(PlainTextFieldStyle())
////                .padding([.horizontal], 7)
////               // .cornerRadius(16)
////                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
////               // .padding([.horizontal], 24)
//
//                .padding()
//
//            Button(action: {
//
//                self.verify()
//
//                guard !email.isEmpty, !password.isEmpty else{return}
//                viewModel.signIn(email: email, password: password)
//
//
//
//            }, label: {
//                Text("ВОЙТИ")
//                    .font(.custom(FontsManager.newBook, size: 17))
//                    .tracking(2)
//                    .padding()
//                    .foregroundColor(.white)
//                    .clipShape(Rectangle())
//                    .frame(width: 250)
//                    .background(Color.black)
//                    .cornerRadius(45)
//            })
//
//            Button(action: {self.showingRegesterView.toggle()}, label: {
//                Text("БЫСТРАЯ РЕГИСТРАЦИЯ")
//                    .font(.custom(FontsManager.newBook, size: 17))
//                    .tracking(2)
//                    .foregroundColor(.white)
//                    .padding()
//                    .clipShape(Rectangle())
//                    .frame(width: 400)
//                    .background(Color.black)
//                    .cornerRadius(45)
//                    .padding()
//
//
//            })
//                .sheet(isPresented: $showingRegesterView, content: {
//                   SigningUp()
//                })
//
//               Spacer()
//
//
//
//        }
//        if self.alert{
//
//            ErrorView(alert: self.$alert, error: self.$error)
//          }
//        }
//
//    }
//    func verify() {
//
//        if self.email != "" && self.password != ""{
//
//                Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, err) in
//
//                    Auth.auth().languageCode = "fr"
//                   if err != nil{
//                       self.error = (err!.localizedDescription)
//                        self.alert.toggle()
//                       return
//                }
//
//                print("success")
//                   UserDefaults.standard.set(true, forKey: "status")
//                   NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
//    }
//        }
//        else{
//
//            self.error = "Пожалуйста, заполните все поля правильно"
//            self.alert.toggle()
//        }
//
//    }
//
        ZStack{
            
            ZStack(alignment: .topTrailing) {
                
                GeometryReader{_ in
                    
                    VStack{
                        
                        Image("slide")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        
                        Text("Log in to your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: self.$email)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack(spacing: 15){
                            
                            VStack{
                                
                                if self.visible{
                                    
                                    TextField("Password", text: self.$password)
                                    .autocapitalization(.none)
                                }
                                else{
                                    
                                    SecureField("Password", text: self.$password)
                                    .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                
                                self.visible.toggle()
                                
                                guard !email.isEmpty, !password.isEmpty else{return}
                                viewModel.signIn(email: email, password: password)
                                
                            }) {
                                
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack{
                            
                            Spacer()
                            
                            Button(action: {
                                
                                self.reset()
                                
                            }) {
                                
                                Text("Forget password")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color"))
                            }
                        }
                        .padding(.top, 20)
                        
                        Button(action: {
                            
                            self.verify()
                            
                            guard !email.isEmpty, !password.isEmpty else{return}
                            viewModel.signIn(email: email, password: password)
                            
                        }) {
                            
                            Text("Log in")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .padding(.top, 25)
                        
                    }
                    .padding(.horizontal, 25)
                }
                
                Button(action: {
                    
                    self.showingRegesterView.toggle()
                    
                    
                }) {
                    
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }
            .sheet(isPresented: $showingRegesterView, content: {
                               SigningUp()
            //.fullScreenCover(isPresented: $showingRegesterView, content: {
               // SigningUp()
            })
           // })
            
            if self.alert{
                
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
    
    func verify(){
        
        if self.email != "" && self.password != ""{
            
            Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, err) in
                
                if err != nil{
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                print("success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        }
        else{
            
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }
    
    func reset(){
        
        if self.email != ""{
            
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                
                if err != nil{
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                self.error = "RESET"
                self.alert.toggle()
            }
        }
        else{
            
            self.error = "Email Id is empty"
            self.alert.toggle()
        }
    }
    
    
}

struct SigningUp: View {
    
    @State private var email = ""
    @State private var password = ""
    @State var repassword = ""
    @State var visible = false
    @State var revisible = false
    @State var color = Color.black.opacity(0.7)
    @State var alert = false
    @State var error = ""
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var showingRegesterView = false
    
    var body: some View {
        
//        VStack{
//           Text("РЕГИСТРАЦИЯ")
//                .font(.custom(FontsManager.newDemi, size: 30))
//                .tracking(2)
//                .padding()
//
//            Text("ПОЧТА")
//                .font(.custom(FontsManager.newLight, size: 12))
//                .tracking(2)
//
//            TextField("", text: $email)
//                .font(.custom(FontsManager.newLight, size: 15))
//                .disableAutocorrection(true)
//                .autocapitalization(.none)
//                .padding()
//                .frame(width:370)
//                .background(RoundedRectangle(cornerRadius: 16).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
//                .padding()
//
//
//            Text("ПАРОЛЬ")
//                .font(.custom(FontsManager.newLight, size: 12))
//                .tracking(2)
//
//            HStack(spacing: 15){
//
//                VStack{
//
//                    if self.visible{
//
//                        TextField("", text: self.$password)
//                        .autocapitalization(.none)
//                    }
//                    else{
//
//                        SecureField("", text: self.$password)
//                        .autocapitalization(.none)
//                    }
//                }
//
//                Button(action: {
//
//                    self.register()
//
//                    self.visible.toggle()
//
//                }) {
//
//                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
//                        .foregroundColor(self.color)
//                }
//
//            }
//            .padding()
//            .frame(width:370)
//            .background(RoundedRectangle(cornerRadius: 16).stroke(self.password != "" ? Color("Color") : self.color,lineWidth: 2))
//            .padding()
//
//
//
//            Text("ПОВТОРИТЕ ПАРОЛЬ")
//                .font(.custom(FontsManager.newLight, size: 12))
//                .tracking(2)
//
//
//
//            HStack(spacing: 15){
//
//                VStack{
//
//                    if self.revisible{
//
//                        TextField("", text: self.$repassword)
//                        .autocapitalization(.none)
//                    }
//                    else{
//
//                        SecureField("", text: self.$repassword)
//                        .autocapitalization(.none)
//                    }
//                }
//
//                Button(action: {
//
//                    self.revisible.toggle()
//
//                }) {
//
//                    Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
//                        .foregroundColor(self.color)
//                }
//
//            }
//            .padding()
//            .frame(width:370)
//            .background(RoundedRectangle(cornerRadius: 16).stroke(self.repassword != "" ? Color("Color") : self.color,lineWidth: 2))
//            .padding()
//
//
//
//
////           SecureField("введите свой пароль", text: $password)
////               .disableAutocorrection(true)
////               .autocapitalization(.none)
////               .padding()
//
//           Spacer()
//                .frame( height: 300)
//            Button(action: {
//
//                self.register()
//
//                guard !email.isEmpty, !password.isEmpty else {return}
//                viewModel.signUp(email: email, password: password)
//            }, label: {
//                Text("ЗАРЕГИСТРИРОВАТЬСЯ")
//                    .padding()
//                    .foregroundColor(.white)
//                    .clipShape(Rectangle())
//                    .frame(width: 350)
//                    .background(Color.black)
//                    .cornerRadius(45)
//
//            })
//
//                Spacer()
//
//
//
//
//
//
//        }
//        if self.alert{
//
//            ErrorView(alert: self.$alert, error: self.$error)
//        }
//
//
//    }
//
//    func register(){
//
//        if self.email != ""{
//
//            if self.password == self.repassword{
//
//                Auth.auth().createUser(withEmail: self.email, password: self.password) { (res, err) in
//
//                    if err != nil{
//
//                        self.error = err!.localizedDescription
//                        self.alert.toggle()
//                        return
//                    }
//
//                    print("success")
//
//                    UserDefaults.standard.set(true, forKey: "status")
//                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
//                }
//            }
//            else{
//
//                self.error = "Password mismatch"
//                self.alert.toggle()
//            }
//        }
//        else{
//
//            self.error = "Please fill all the contents properly"
//            self.alert.toggle()
//        }
//    }
//
//
//
        ZStack{
            
            ZStack(alignment: .topLeading) {
                
                GeometryReader{_ in
                    
                    VStack{
                        
                        Image("slide")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        
                        Text("Log in to your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: self.$email)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack(spacing: 15){
                            
                            VStack{
                                
                                if self.visible{
                                    
                                    TextField("Password", text: self.$password)
                                    .autocapitalization(.none)
                                }
                                else{
                                    
                                    SecureField("Password", text: self.$password)
                                    .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                
                                self.visible.toggle()
                                
                            }) {
                                
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack(spacing: 15){
                            
                            VStack{
                                
                                if self.revisible{
                                    
                                    TextField("Re-enter", text: self.$repassword)
                                    .autocapitalization(.none)
                                }
                                else{
                                    
                                    SecureField("Re-enter", text: self.$repassword)
                                    .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                
                                self.revisible.toggle()
                                
                            }) {
                                
                                Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.repassword != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        Button(action: {
                            
                            self.register()
                            
                            //guard !email.isEmpty, !password.isEmpty ,repassword == password  else {return}
                           // viewModel.signUp(email: email, password: password,repassword: repassword)
                            
                            
//                               }
//
                        }) {
                            
                            Text("Register")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .padding(.top, 25)
                        
                    }
                    .padding(.horizontal, 25)
                }
                
//                Button(action: {
//
//                    self.showingRegesterView.toggle()
//
//                }) {
//
//                    Image(systemName: "chevron.left")
//                        .font(.title)
//                        .foregroundColor(Color("Color"))
//                }
                //.padding()
            }
            
            if self.alert{
                
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func register(){
        
        if self.email != ""{
            
            if self.password == self.repassword{
                
                //viewModel.signUp(email: email, password: password)
                
                Auth.auth().createUser(withEmail: self.email, password: self.password) { (res, err) in
                   
                    
                    if err != nil{
                        
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    //viewModel.signUp(email: email, password: password)
                    
                    print("success")
                    
                    
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                    
                   
                }
            }
            else{
                
                self.error = "Password mismatch"
                self.alert.toggle()
            }
        }
        else{
            
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }
}



struct ErrorView : View {
    
    @State var color = Color.black
    @Binding var alert : Bool
    @Binding var error : String
    
    var body: some View{
        
        GeometryReader{geometry in
           
            
            VStack(spacing:10){
                
                HStack{
                    
                    Text(self.error == "RESET" ? "Message" : "ОШИБКА")
                        .font(.custom("Futura-Bold", size: 15))
                        .tracking(2)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error == "RESET" ? "Password reset link has been sent successfully" : self.error)
                .foregroundColor(self.color)
                .padding(.top)
                .padding(.horizontal, 25)
                
                Button(action: {
                    
                    self.alert.toggle()
                    
                }) {
                    
                    Text(self.error == "RESET" ? "Ok" : "ОТМЕНА")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top, 25)
                
            }
            
            .padding(.vertical, 25)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
       .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
        
        
        
    
    
    }
}




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
