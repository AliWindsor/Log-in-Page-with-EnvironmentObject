//
//  UserImage.swift
//  Log-in Page
//
//  Created by Alicia Windsor on 03/06/2021.
//

import SwiftUI

struct UserImage: View{
    var body: some View{
        Image("login-avatar")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom)
    }
}
