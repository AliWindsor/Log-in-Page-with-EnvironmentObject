//
//  Log_in_PageApp.swift
//  Log-in Page
//
//  Created by Alicia Windsor on 03/06/2021.
//

import SwiftUI

@main
struct Log_in_PageApp: App {
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewRouter)
        }
    }
}
