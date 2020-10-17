//
//  CustomTableViewCell.swift
//  MDBProject2
//
//  Created by Kanu Grover on 9/30/20.
//  Copyright © 2020 Kanu Grover. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var ID: UILabel!
    
    @IBOutlet var pokemonImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
