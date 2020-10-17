//
//  PokemonViewController.swift
//  MDBProject2
//
//  Created by Kanu Grover on 10/8/20.
//  Copyright © 2020 Kanu Grover. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet var name: UILabel! {
        didSet {
            name.text = name1
        }
    }

    @IBOutlet var id: UILabel!{
        didSet {
            id.text = id1
            id.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 15)
        }
    }
    
    @IBOutlet var pokemonImage: UIImageView!{
        didSet {
            pokemonImage.image = pokemonImage1
        }
    }
    
    @IBOutlet var speed: UILabel!{
        didSet {
            speed.text = speed1
            speed.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 20)
        }
    }
    
    @IBOutlet var attack: UILabel!{
        didSet {
            attack.text = attack1
            attack.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 20)
        }
    }
    
    @IBOutlet var hp: UILabel! {
        didSet {
            hp.text = hp1
            hp.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 20)
        }
    }
        
    @IBOutlet var defense: UILabel! {
        didSet {
            defense.text = defense1
            defense.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 20)
            
        }
    }
    
    @IBOutlet var spDef: UILabel! {
        didSet {
            spDef.text = spDef1
            spDef.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 20)
        }
    }
    
    @IBOutlet var spAtk: UILabel! {
        didSet {
                spAtk.text = spAttack1
                spAtk.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 20)
        }
    }
    
    
    var name1: String?
    var id1: String?
    var pokemonImage1: UIImage?
    var speed1: String?
    var attack1: String?
    var hp1: String?
    var defense1: String?
    var spDef1: String?
    var spAttack1: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.font = UIFont(name: "GillSans-Bold", size: 30)

    }

}
