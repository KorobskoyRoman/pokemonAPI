//
//  NetworkManager.swift
//  fetchData
//
//  Created by Roman Korobskoy on 25.11.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func requestData(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }.resume()
    }
    
//    static func getRequest(url: String) {
//
//        guard let url = URL(string: url) else { return }
//
//        let session = URLSession.shared
//        session.dataTask(with: url) { (data, response, error) in
//
//            guard
//                let response = response,
//                let data = data
//            else { return }
//
//            print(response)
//            print(data)
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
//            } catch {
//                print(error.localizedDescription)
//            }
//        } .resume()
//    }
}



