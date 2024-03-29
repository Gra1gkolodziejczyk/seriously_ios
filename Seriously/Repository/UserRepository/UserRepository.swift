//
//  UserRepository.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 23/03/2024.
//

import Foundation

class UserRepository {
    func login(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let parameters = ["email": email, "password": password]
        
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
}
