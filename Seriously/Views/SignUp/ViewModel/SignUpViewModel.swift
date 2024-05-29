//
//  SignUpViewModel.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 10/05/2024.
//

import Foundation

@MainActor
class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var photos: [String] = []
    @Published var biography: String = ""
    @Published var age: String = ""
    @Published var gender: String = ""
    @Published var sexuality: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    @Published var emailErrorMessage: String = ""
    @Published var passwordErrorMessage: String = ""
    @Published var ageErrorMessage: String = ""
    @Published var genderErrorMessage: String = ""
    
    private let userRepository = UserRepository()
    
    func signUp() {
        // Validation des champs
        emailErrorMessage = !isValidEmail(email) ? "Le format de l'email est invalide." : ""
        passwordErrorMessage = !isValidPassword(password) ? "Le mot de passe doit contenir au moins 8 caractères." : ""
        ageErrorMessage = !isValidAge(age) ? "L'âge doit être un nombre valide." : ""
        genderErrorMessage = !isValidGender(gender) ? "Le genre doit être 'masculin', 'féminin' ou 'autres'." : ""
        
        guard isValidEmail(email), isValidPassword(password), isValidAge(age), isValidGender(gender) else {
            return
        }
        
        var determinedSexuality: Sexuality = .hetero
            
        switch (Gender(rawValue: gender), sexuality) {
        case (.masculin?, "homo"), (.feminin?, "homo"):
            determinedSexuality = .homo
        case (.masculin?, "hetero"), (.feminin?, "hetero"):
            determinedSexuality = .hetero
        case (_, "be"):
            determinedSexuality = .be
        default:
            break
        }
        
        userRepository.register(
            model: SignUpModel(
                email: email,
                password: password,
                photos: photos,
                biographie: biography,
                age: Int(age)!,
                gender: Gender(rawValue: gender)!,
                sexuality: determinedSexuality,
                localisation: Localisation(x: 0.0, y: 0.0)
            )
        ) { [weak self] result in
            switch result {
            case .success:
                self?.isLoggedIn = true
                self?.errorMessage = ""
                print("Inscription réussie!")
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
    
    private func isValidAge(_ age: String) -> Bool {
        return Int(age) != nil
    }
    
    private func isValidGender(_ gender: String) -> Bool {
        return gender == "masculin" || gender == "féminin" || gender == "autres"
    }
}
