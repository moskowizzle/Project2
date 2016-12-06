//
//  MainTableViewCell.swift
//  Project 2
//
//  Created by Andrew Moskowitz on 12/5/16.
//  Copyright © 2016 Andrew Moskowitz. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var headlineLabel: UITextView!
    @IBOutlet weak var previewLabel: UITextView!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
