//
//  LoginView.swift
//  Log-in Page
//
//  Created by Alicia Windsor on 03/06/2021.
//

import SwiftUI

struct UserDetailsView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @Binding var userName:String
    @Binding var userModelData : UserModelData
     var userInformation : UserModel?
    
    var body: some View{
            VStack{
               
                if let items = userInformation{
                    Text("\(items.username)'s \(items.type)")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    List(items.items, id: \.self){ item in
                        Text(item)
                    }
                }
               
                Button(action: {
                    withAnimation {
                        viewRouter.currentPage = .loginPage
                    }
                }) {
                    CustomButtonStyle(buttonText: "Logout")
                }
          
        }

    }
}
