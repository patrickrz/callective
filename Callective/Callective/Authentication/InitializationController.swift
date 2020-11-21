//
//  InitializationController.swift
//  Match
//
//  Created by Abhishek Kattuparambil on 10/13/20.
//  Copyright © 2020 Abhishek Kattuparambil. All rights reserved.
//

import UIKit
import Firebase

class InitializationController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        checkUser()
    }
    
    func checkUser(){
        if let user = Auth.auth().currentUser {
            AuthenticationController.user = User(email: user.email ?? "", username: user.displayName!, uid: user.uid)
            self.performSegue(withIdentifier: "signedIn", sender: self)
        } else{
            self.performSegue(withIdentifier: "noUser", sender: self)
        }
    }

}
