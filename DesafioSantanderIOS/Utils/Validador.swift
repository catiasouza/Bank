//
//  Validador.swift
//  DesafioSantanderIOS
//
//  Created by Cátia Souza on 26/03/21.
//

import Foundation

class Validator {
   
    static func isValid(username: String) -> String? {
        if username.isEmpty { return
             "error"
        }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        if !username.matchRegex(emailRegex) && !username.isCPF {
            return "error"
        }
        
        return nil
    }
    
    static func isValid(password: String) -> Bool {
        if password.isEmpty { return false }
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{3,}"
        if !password.matchRegex(passwordRegex) {  return false }
        return true
    }
}
