//
//  ResetPasswordViewController.swift
//  Firebase_LoginAndSignUp
//
//  Created by user on 07/03/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit
import FirebaseAuth

class ResetPasswordViewController: UIViewController {

    
    // MARK: - Properties
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    
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
    
    @IBAction func resetPasswordAction(_ sender: UIButton) {
        
        if let email = emailTextField.text{
            FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { (error) in
                var title = ""
                var message = ""
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                }else{
                    title = "Success!!"
                    message = "Password reset email sent."
                    self.emailTextField.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(action)
                
                self.present(alertController, animated: true, completion: nil)
                
            })
        }else{
            let alertController = UIAlertController(title: "Oops!!", message: "Please enter an email", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(action)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    // MARK: - Functions

}
