//
//  LoginViewController.swift
//  Twitter
//
//  Created by Yaying Liang on 3/24/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
                
                TwitterAPICaller.client?.login(url: myUrl, success: {
                    // keep the user login by creating a "userLoggedIn" variable whenever the user logged in
                    UserDefaults.standard.set(true, forKey: "userLoggedIn")
                    
                    // Check if user already logged in, if so, don't ask user to log in again
                    self.performSegue(withIdentifier: "loginToHome", sender: self)
                }, failure: { (Error) in
                    print("Could not log in!")
                })
    }
}
