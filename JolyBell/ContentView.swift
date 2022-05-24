//
//  ContentView.swift
//  JolyBell
//
//  Created by Arseni Khatsuk on 25.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("slide")
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 250)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
