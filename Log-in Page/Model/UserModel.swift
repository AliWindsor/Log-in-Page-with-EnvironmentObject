//
//  UserModel.swift
//  Log-in Page
//
//  Created by Alicia Windsor on 03/06/2021.
//

import Foundation

struct UserModel: Hashable, Codable{
    var username: String
    var password: String
    var type: String
    var items: [String]
}
