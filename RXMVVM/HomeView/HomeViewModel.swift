//
//  HomeViewModel.swift
//  RXMVVM
//
//  Created by Giovane Barreira on 29/06/22.
//

import Foundation

final class HomeViewModel {
    var welcomeMessage: ObservableObject<String?> = ObservableObject(nil)
    
    func getLoggedUser() {
        let user = NetworkService.shared.getLoggedUser()
        self.welcomeMessage.value = "Hello, \(user.firstName) \(user.lastName)"
    }
}
