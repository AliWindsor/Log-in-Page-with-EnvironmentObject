//
//  viewRouter.swift
//  Log-in Page
//
//  Created by Alicia Windsor on 03/06/2021.
//

import SwiftUI
import Foundation

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .loginPage
    
}

enum Page {
    case loginPage
    case userDetailsPage
}
