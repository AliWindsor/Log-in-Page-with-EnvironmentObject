//
//  LoginButtonStyle.swift
//  Log-in Page
//
//  Created by Alicia Windsor on 03/06/2021.
//

import SwiftUI

struct CustomButtonStyle: View{
    var buttonText = ""
    var body: some View{
        Text(buttonText)
            .foregroundColor(.white)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .font(.title2)
            .frame(width: 220, height: 30)
            .padding()
            .background(Color.black)
            .cornerRadius(30.0)
    }
}
