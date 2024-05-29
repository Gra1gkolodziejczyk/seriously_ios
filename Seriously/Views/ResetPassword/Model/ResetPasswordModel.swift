//
//  ResetPasswordModel.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 10/05/2024.
//

import Foundation

struct ResetPasswordModel {
    let newPassword: String
    let confirmNewPassword: String
    
    init(newPassword: String, confirmNewPassword: String) {
        self.newPassword = newPassword
        self.confirmNewPassword = confirmNewPassword
    }
}
