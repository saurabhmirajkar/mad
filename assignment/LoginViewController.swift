//
//  ViewController.swift
//  assignment
//
//  Created by Saurabh Mirajkar on 15/01/20.
//  Copyright © 2020 Saurabh Mirajkar. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if idTextField.text != "" && passwordTextField.text != "" {
            postAction(email: idTextField.text!, password: passwordTextField.text!)
        }
    }
    
    // Note: Here I need a valid user credentials in order to receive the token.
    // I will be writing a dummy code to show what will I do after receiving the token
    
    
    func postAction(email: String, password: String) {
        let url = String(format: "https://reqres.in/api/login/")
        let parameters = ["email" : email, "password" : password]

        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { response in
            print(response)
            if response.result.value == nil {
                print("No response")
                return
            } else {
                let responseData = response.result.value as! NSDictionary
                let token = responseData["token"] as? String
                UserDefaults.standard.set(token, forKey: "token")
                
                // Navigate to other screen
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let destinationVC = storyboard.instantiateViewController(identifier: "WebViewController")
                self.present(destinationVC, animated: true, completion: nil)
            }
        }
    }
    
}

