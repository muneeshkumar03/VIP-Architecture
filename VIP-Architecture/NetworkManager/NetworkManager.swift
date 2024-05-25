//
//  NetworkManager.swift
//  VIP-Architecture
//
//  Created by Muneesh Kumar on 24/05/24.
//

import Foundation

enum VIPError: Error {
    case inValidURL
    case apiError(errorMessage: String?)
    case invalidData
    case parsingError
}

class NetworkManager {
    func getData<T: Codable>(modelType: T.Type, urlStr: String, completion: @escaping (Result <T, VIPError>) -> Void) {
        guard let url = URL(string: urlStr) else {
            completion(.failure(VIPError.inValidURL))
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            if (error != nil) {
                completion(.failure(VIPError.apiError(errorMessage: error?.localizedDescription)))
            }
            if let dataObj = data {
                let model = try? JSONDecoder().decode(modelType, from: dataObj)
                if let modelObj = model {
                    completion(.success(modelObj))
                } else {
                    completion(.failure(VIPError.parsingError))
                }
            }
        }
        session.resume()
    }
}
