//
//  StartGameViewController.swift
//  MDBProject1
//
//  Created by Kanu Grover on 9/19/20.
//  Copyright © 2020 Kanu Grover. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController {
    

    @IBOutlet weak var startGame: UIButton!
    
    @IBAction func seguePressed(_ sender: Any) {
        performSegue(withIdentifier: "Start Game", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame.layer.cornerRadius = 20
        startGame.clipsToBounds = true
    }
    
}
