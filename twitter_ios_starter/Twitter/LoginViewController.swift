//
//  LoginViewController.swift
//  Twitter
//
//  Created by Karan Pandya on 2/16/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    
    let myURL = "https://api.twitter.com/oauth/request_token"
    @IBAction func onLoginButton(_ sender: Any) {
        //This function runs when a user successfully logs in
        TwitterAPICaller.client?.login(url: myURL, success: {
            //This saves users info so they don't have to login again if they close the app
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            //This calls on the "transition" that we created earlier "loginToHome"
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { Error in
            print ("Could not login!")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
