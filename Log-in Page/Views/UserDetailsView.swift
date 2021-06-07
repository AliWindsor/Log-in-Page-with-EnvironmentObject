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
        NavigationView{
            VStack{
               
                if let items = userInformation{
                    List(items.items, id: \.self){ item in
                        NavigationLink(destination: WebView(url:"https://www.ecosia.org/images?q=\(item)")){
                            Text(item)
                         
                        }
                    }
                    .navigationTitle(Text("\(items.username)'s \(items.type)"))
                }
               
                Button(action: {
                    withAnimation {
                        viewRouter.currentPage = .loginPage
                    }
                }) {
                    CustomButtonStyle(buttonText: "Logout")
                    
                }
                
                Spacer()
                    .frame(height: 35)
            }
            

        }
    }
}
