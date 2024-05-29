//
//  UserRepository.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 23/03/2024.
//

import Foundation

class UserRepository {
    // Function login
    func login( model: SignInModel, completion: @escaping (Result<Bool, Error>) -> Void) {
        let parameters = ["email": model.email, "password": model.password]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Error serializing data."])))
            return
        }
        
        let url = URL(string: "http://localhost:9001/users/auth/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Login failed. Please try again."])))
                return
            }
            
            completion(.success(true))
        }.resume()
    }
    
    // Function register
    func register(model: SignUpModel, completion: @escaping (Result<Bool, Error>) -> Void) {
        let parameters: [String: Any] = [
            "email": model.email,
            "password": model.password,
            "photos": model.photos,
            "biographie": model.biographie,
            "age": model.age,
            "gender": model.gender,
            "sexuality": model.sexuality,
            "localisation": [
                "x": model.localisation.x,
                "y": model.localisation.y,
            ]
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Error serializing data."])))
            return
        }
        
        let url = URL(string: "http://localhost:9001/users/auth/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Registration failed. Please try again."])))
                return
            }
            
            completion(.success(true))
        }.resume()
    }
    
    // Function resetPassword
    func resetPassword( model: ResetPasswordModel, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard model.newPassword == model.confirmNewPassword else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Les nouveaux mots de passe ne correspondent pas."])))
                return
            }
            
        let parameters = ["newPassword":model.newPassword, "confirmNewPassword": model.confirmNewPassword]
            
            guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Erreur de sérialisation des données."])))
                return
            }
            
            // Configurer la requête
            let url = URL(string: "http://localhost:9001/users/auth/resetpassword")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "La réinitialisation du mot de passe a échoué. Veuillez réessayer."])))
                    return
                }
                
                completion(.success(true))
            }.resume()
        }
}
