//
//  User.swift
//  Match
//
//  Created by Abhishek Kattuparambil on 10/12/20.
//  Copyright © 2020 Abhishek Kattuparambil. All rights reserved.
//

import UIKit
import Firebase
import MapKit

let db = Firestore.firestore()

class User {
    let email: String
    var username: String
    let uid: String
    
    init(email: String, username: String, uid: String) {
        self.email = email
        self.username = username
        self.uid = uid
        DispatchQueue.main.async {
            let userRef = db.collection("users").document(uid)
            userRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    /*self.righty = document.data()!["righty"] as? Bool
                    self.battingPos = document.data()!["batting position"] as? String
                    self.bowlingPos = document.data()!["bowling position"] as? String
                    self.isPlayer = document.data()!["profile type"] as? Bool
                    self.website = document.data()!["website"] as? String
                    self.home = document.data()!["home"] as? String
 */
                }
            }
        }
    }
    
    func addUser() {
        db.collection("users").document(uid).setData([
            "email": email,
            "username": username,
            "uid": uid
        ]) { (err) in
            if let err = err{
                print("Error adding document: \(err)")
            } else {
                print("Document added with reference ID: \(self.uid)")
            }
        }
    }
    
}
