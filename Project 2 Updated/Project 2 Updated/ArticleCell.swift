//
//  ArticleCell.swift
//  Project 2 Updated
//
//  Created by Andrew Moskowitz on 12/18/16.
//  Copyright © 2016 Andrew Moskowitz. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleHeadlineLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
