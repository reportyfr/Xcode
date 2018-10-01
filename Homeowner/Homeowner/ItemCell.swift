//
//  ItemCell.swift
//  Homeowner
//
//  Created by teacher on 10/27/16.
//  Copyright © 2016 Syracuse University. All rights reserved.
//

import UIKit

//ItemCell is a custom cell
class ItemCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    //function to set fonts of labels
    func updateLabels() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        nameLabel.font = bodyFont
        valueLabel.font = bodyFont
        
        let captionFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
        serialNumberLabel.font = captionFont
    }

}
