//
//  SignInModel.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 10/05/2024.
//

import Foundation

struct SignInModel {
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
