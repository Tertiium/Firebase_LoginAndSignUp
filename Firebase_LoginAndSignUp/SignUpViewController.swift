//
//  SignUpViewController.swift
//  Firebase_LoginAndSignUp
//
//  Created by user on 07/03/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Outlets

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Actions
    
    @IBAction func createAccountAction(_ sender: UIButton) {
        
        if let email = emailTextField.text, let passsword = passwordTextField.text{
            
            FIRAuth.auth()?.createUser(withEmail: email, password: passsword, completion: { (user, error) in
                if error != nil {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }else{
                    print("You have successfully signed up")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                }
                
            })
            
        }else{
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    
    // MARK: - Functions

}
