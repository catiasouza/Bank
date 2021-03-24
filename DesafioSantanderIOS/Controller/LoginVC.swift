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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 4
        
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        
    }
    
   
}
