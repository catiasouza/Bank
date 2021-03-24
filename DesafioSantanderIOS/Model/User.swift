//
//  DescModel.swift
//  DesafioSantanderIOS
//
//  Created by Cátia Souza on 24/03/21.
//

import Foundation

struct User: Codable {
    let client: [Users]
    
    private enum CodingKeys: String, CodingKey{
        case client = "statementList"
    }
}
struct Users: Codable {
    let title: String?
    let desc: String?
    let date: String?
    let value: Double?
    
    private enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case desc = "desc"
        case date = "date"
        case value = "value"
        
    }
}
