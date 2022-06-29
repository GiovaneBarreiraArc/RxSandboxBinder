//
//  NetworkService.swift
//  RXMVVM
//
//  Created by Giovane Barreira on 29/06/22.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    private var user: User?
    
    private init() {}
    
    func login(email: String, password: String, completion: @escaping(Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            if email == "test@test.com" && password == "password" {
                self.user = User(firstName: "Giovane", lastName: "Barreira", email: "test@test,com", age: 33)
                completion(true)
            } else {
                self.user = nil
                completion(false)
            }
        }
    }
    
    func getLoggedUser() -> User {
       return user!
    }
}
