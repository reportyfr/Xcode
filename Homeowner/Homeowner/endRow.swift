//
//  LastCell.swift
//  Homeowner
//
//  Created by Sid Sachdev on 4/4/17.
//  Copyright © 2016 Syracuse University. All rights reserved.
//

import UIKit

class LastCell: UITableViewCell {
    // create a custom cell for the no more items
    @IBOutlet var itemLabel: UILabel!
    
    //function to set fonts of labels
    func updateLabels() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        itemLabel.font = bodyFont
    }
    
}
