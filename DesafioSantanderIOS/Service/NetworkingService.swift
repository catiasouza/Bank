//
//  NetworkingService.swift
//  DesafioSantanderIOS
//
//  Created by Cátia Souza on 26/03/21.
//

import Foundation

enum MyEnum<T, E: Error>{
    case success(T)
    case failure(E)
}
class NetworkingService{
    
    let baseUrl = "https://bank-app-test.herokuapp.com/api"
    func request(endpoint: String,paramters: [String: Any], completion: @escaping(Result<Login, Error>) -> Void){
        guard let url = URL(string: baseUrl + endpoint) else {
            completion(.failure(NetworkingError.badUrl))
            return
        }
        var request = URLRequest(url: url)
        var components = URLComponents()
        var queryItems = [URLQueryItem]()
        for (key, value) in paramters {
            let queryItem = URLQueryItem(name: key, value: String(describing: value))
            queryItems.append(queryItem)
        }
        components.queryItems = queryItems
        let queryItemData = components.query?.data(using: .utf8)
        
        request.httpBody = queryItemData
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request){(data, response , error) in
            DispatchQueue.main.async {
            
            guard let unwrappedresponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkingError.badResponse))
                return
            }
            print(unwrappedresponse.statusCode)
            switch unwrappedresponse.statusCode{
            case 200 ..< 300:
                print("sucesso")
            default:
                print("Erro")
            }
            if let unwrappederror = error{
                completion(.failure(unwrappederror))
                return
            }
            if let unwrappedData = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                    print(json)
                }catch {
                    completion(.failure(error))
                }
            }
            }
        }
        task.resume()
    }
}
enum NetworkingError: Error{
    case badUrl
    case badResponse
}
