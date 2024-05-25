//
//  EmployeeRouter.swift
//  VIP-Architecture
//
//  Created by Muneesh Kumar on 25/05/24.
//

import Foundation

protocol EmployeeRouterInput {
    func displayErrorScreen()
}

class EmployeeRouter {
    
}

extension EmployeeRouter: EmployeeRouterInput {
    func displayErrorScreen(errorMessage: String) {
        // move user to error screen
    }
}
