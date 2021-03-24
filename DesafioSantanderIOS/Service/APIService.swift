//
//  APIService.swift
//  DesafioSantanderIOS
//
//  Created by Cátia Souza on 24/03/21.
//

import Foundation

class APIservice {
    
    private var dataTask: URLSessionTask?
    
    func getUserInformation(completion: @escaping (Result<User, Error>) -> Void) {
        let userInfoUrl = "https://bank-app-test.herokuapp.com/api/statements/1"
        
        guard let url = URL(string: userInfoUrl) else { return}
        
        dataTask = URLSession.shared.dataTask(with: url) {(data,response, error) in
            
            if let error = error {
                completion(.failure(error))
                print("deu ruim: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("vazio Response")
                return
            }
            print("response statusCode: \(response.statusCode)")
            guard let data = data else {
                print("Vazio Data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(User.self, from: data)

                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }

            }catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
