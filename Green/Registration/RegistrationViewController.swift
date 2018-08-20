//
//  RegistrationViewController.swift
//  Green
//
//  Created by Stefan Thomsen on 20/08/18.
//  Copyright © 2018 CreativeDev. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var usernameField:UITextField!
    @IBOutlet weak var passwordField:UITextField!
    
    @IBOutlet weak var alertView:UIView!
    @IBOutlet weak var alertLabel:UILabel!
    
    @IBOutlet weak var facebookButton:FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        facebookButton.readPermissions = ["public_profile", "email"]
        facebookButton.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isCredencialsValid()->Bool{
        alertView.isHidden = true;
        
        guard let username = usernameField.text else{
            return false
        }
        if (username.count < 5){
            alertView.isHidden = false;
            alertLabel.text = "Username must have at leat 5 characters";
            return false;
        }
        
        guard let password = passwordField.text else{
            return false
        }
        if (password.count < 5){
            alertView.isHidden = true;
            alertLabel.text = "Pasword must have at leat 5 characters";
            return false;
        }
        return true;
    }

}

extension RegistrationViewController:FBSDKLoginButtonDelegate{
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        //TODO: Check if was sucess login using facebook
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
}
