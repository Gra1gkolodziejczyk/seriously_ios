//
//  LoginViewModel.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 23/03/2024.
//

import Foundation

@MainActor
class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    @Published var passwordErrorMessage: String = ""
    @Published var emailErrorMessage: String = ""
    
    private let userRepository = UserRepository()
    
    func login() {
        emailErrorMessage = !isValidEmail(email) ? "Le format de l'email est invalide." : ""
        passwordErrorMessage = !isValidPassword(password) ? "Le mot de passe doit contenir au moins 8 caractères." : ""
        
        guard isValidEmail(email), isValidPassword(password) else {
            return
        }
        
        userRepository.login(model: SignInModel(email: email, password: password)) { [weak self] result in
            switch result {
            case .success(let accessToken):
                UserDefaults.standard.set(accessToken, forKey: "accessToken")
                self?.isLoggedIn = true
                self?.errorMessage = ""
                print("AccessToken:", accessToken)
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        return password.count >= 8
    }
}

