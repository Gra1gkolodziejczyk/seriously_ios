//
//  UserModel.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 04/03/2024.
//

import Foundation

struct UserModel {
    let id: String
    let email: String
    let password: String
    let username: String
    let firstname: String
    let lastname: String
    let photos: [String]
    
    init(id: String, email: String, password: String, username: String, firstname: String, lastname: String, photos: [String]) {
        self.id = id
        self.email = email
        self.password = password
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.photos = photos
    }
}
