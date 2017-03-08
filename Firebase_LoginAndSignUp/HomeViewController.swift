//
//  HomeViewController.swift
//  Firebase_LoginAndSignUp
//
//  Created by user on 07/03/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    
    // MARK: - Properties
    
    // MARK: - Outlets
    
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
    
    @IBAction func logOutAction(_ sender: UIButton) {
        
        if FIRAuth.auth()?.currentUser != nil{
            do{
                try FIRAuth.auth()?.signOut()
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUp"){
                    present(vc, animated: true, completion: nil)
                }
            }catch let error as NSError{
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    // MARK: - Functions
}
