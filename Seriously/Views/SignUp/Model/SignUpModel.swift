//
//  SignUpModel.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 10/05/2024.
//

import Foundation

enum Gender: String {
    case masculin
    case feminin
    case autres
}

enum Sexuality {
    case hetero
    case homo
    case be
}

struct Localisation {
    let y: Float
    let x: Float
    
    init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
}

struct SignUpModel {
    let email: String
    let password: String
    let photos: [String]
    let biographie: String
    let age: Int
    let gender: Gender
    let sexuality: Sexuality
    let localisation: Localisation
    
    init(
            email: String,
            password: String,
            photos: [String],
            biographie: String,
            age: Int,
            gender: Gender,
            sexuality: Sexuality,
            localisation: Localisation
    ) {
        self.email = email
        self.password = password
        self.photos = photos
        self.biographie = biographie
        self.age = age
        self.gender = gender
        self.sexuality = sexuality
        self.localisation = localisation
    }
}
