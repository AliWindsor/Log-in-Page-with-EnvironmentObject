//
//  ContentView.swift
//  Log-in Page
//
//  Created by Alicia Windsor on 03/06/2021.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var userName:String = ""
    @State var userModelData = UserModelData()
    var userInformation : UserModel?{
        userModelData.userInformation.first { $0.username == userName }
    }
    
    init(){
        UITableView.appearance().backgroundColor = .white
    }
    
    var body: some View {
        switch viewRouter.currentPage {
        
            case .userDetailsPage:
                UserDetailsView(userName: $userName, userModelData: $userModelData, userInformation: userInformation)
                    .transition(.move(edge: .trailing))
                
            case .loginPage:
                LoginView(userName: $userName, userModelData: $userModelData, userInformation: userInformation)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           // .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            //.previewDisplayName("iPhone 11")
            .environmentObject(ViewRouter())
        /*
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 12 Pro Max")
            .environmentObject(ViewRouter())*/
    }
}
