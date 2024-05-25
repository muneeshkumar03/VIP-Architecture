//
//  EmployeeWorker.swift
//  VIP-Architecture
//
//  Created by Muneesh Kumar on 24/05/24.
//

import Foundation

class EmployeeWorker {
    
    func getEmployeeData<T: Codable>(modelType: T.Type, urlStr: String, completion: @escaping (Result <T, VIPError>) -> Void) {
        let networkManager = NetworkManager()
        networkManager.getData(modelType: modelType, urlStr: urlStr, completion: completion)
    }
}
