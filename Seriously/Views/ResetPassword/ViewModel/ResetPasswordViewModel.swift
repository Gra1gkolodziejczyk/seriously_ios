//
//  ResetPasswordViewModel.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 10/05/2024.
//

import Foundation

@MainActor
class ResetPasswordViewModel: ObservableObject {
    private let userRepository = UserRepository()

    @Published var newPassword: String = ""
    @Published var confirmNewPassword: String = ""
    @Published var errorMessage: String?
    @Published var isSuccess: Bool = false
    
    func resetPassword() {
        guard !newPassword.isEmpty else {
            errorMessage = "Veuillez saisir un nouveau mot de passe."
            return
        }
        
        guard !confirmNewPassword.isEmpty else {
            errorMessage = "Veuillez confirmer votre nouveau mot de passe."
            return
        }
        
        guard newPassword == confirmNewPassword else {
            errorMessage = "Les deux mots de passe doivent correspondre."
            return
        }
        
        userRepository.resetPassword(model: ResetPasswordModel(newPassword: newPassword, confirmNewPassword: confirmNewPassword)) { result in
            switch result {
            case .success:
                self.isSuccess = true
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
