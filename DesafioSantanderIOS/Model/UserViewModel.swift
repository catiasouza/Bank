//
//  UserViewModel.swift
//  DesafioSantanderIOS
//
//  Created by Cátia Souza on 24/03/21.
//

import Foundation

class UserViewModel {
    
    private var apiService = APIservice()
    private var arrayUsers = [Users]()
    
    func fetchClient(completion: @escaping() -> ()){
        apiService.getUserInformation { [weak self](result) in
            
            switch result {
            case .success(let listOf):
                self?.arrayUsers = listOf.client
                completion()
            case .failure(let error):
                print("erro ao processar jsonn\(error)")
            }
        }
    }
    func numberOfRowsInSection(section: Int)-> Int {
        if arrayUsers.count != 0 {
            return arrayUsers.count
        }
        return 0
    }
    func cellForRowAt(indexpath: IndexPath) -> Users{
        return arrayUsers[indexpath.row]
    }
}
