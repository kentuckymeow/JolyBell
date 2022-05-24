//
//  Home.swift
//  JolyBell
//
//  Created by Arseni Khatsuk on 25.05.2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 20){
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
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
