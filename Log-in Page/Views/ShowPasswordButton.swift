//
//  ShowPasswordButton.swift
//  Log-in Page
//
//  Created by Alicia Windsor on 03/06/2021.
//

import SwiftUI

struct ShowPasswordButton: View{
    
    @Binding var showPassword: Bool
    
    var body: some View{
        Button(action:{self.showPassword.toggle()}){
            Text("Show Password")
                .foregroundColor(.gray)
        }
        .padding()
    }
}
