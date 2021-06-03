//
//  evironmentObjectTesting.swift
//  Log-in Page
//
//  Created by Alicia Windsor on 03/06/2021.
//

import SwiftUI

struct EvironmentObjectTesting: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .loginPage:
            ViewA()
        case .userDetailsPage:
            ViewB()
        }
    }
}

struct ViewA: View{
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
            Text("A")
            Button(action: {
                withAnimation {
                    viewRouter.currentPage = .userDetailsPage
                }
            }) {
                CustomButtonStyle(buttonText: "Next")
            }
        }
    }
}

struct ViewB: View{
    var body: some View {
        Text("B")
    }
}

struct evironmentObjectTesting_Previews: PreviewProvider {
    static var previews: some View {
        EvironmentObjectTesting().environmentObject(ViewRouter())
    }
}
