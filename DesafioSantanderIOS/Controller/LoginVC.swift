//
//  LoginVC.swift
//  DesafioSantanderIOS
//
//  Created by Cátia Souza on 24/03/21.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    let networkingService = NetworkingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 4
        
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let novoViewController = storyBoard.instantiateViewController(withIdentifier: "ViewViaCodigo")
        self.present(novoViewController, animated: true, completion: nil)
   
        guard let username = user.text, let password = password.text else {return}
        let parameters = ["user": username, "password": password]
        networkingService.request(endpoint: "/login", paramters: parameters) { (result) in
            print(result)

        }
        print(username)
        print(password)
   }
    }
    
   

