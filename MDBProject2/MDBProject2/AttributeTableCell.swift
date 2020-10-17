//
//  AttributeTableCell.swift
//  MDBProject2
//
//  Created by Kanu Grover on 10/15/20.
//  Copyright © 2020 Kanu Grover. All rights reserved.
//

import UIKit

class AttributeTableCell: UITableViewCell {

    @IBOutlet var range: UILabel!
    
    var lower: Int = 0
    var upper: Int = 999
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        range.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.range.text = "\(String(lower)) - \(String(upper))"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
