//
//  StatisticsViewController.swift
//  MDBProject1
//
//  Created by Kanu Grover on 9/26/20.
//  Copyright © 2020 Kanu Grover. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak var streakScore: UILabel!
    
    @IBOutlet var names: [UILabel]!
    
    var streak = 0
    
    var lastThreeNames = [String]()
    
    func updateView() {
        streakScore.text = "Streak: \(streak)"
        for index in 0..<lastThreeNames.count {
            let button = names[index]
            button.text = lastThreeNames[index]
        }
    }
    
    override func viewDidLoad() {
        updateView()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
