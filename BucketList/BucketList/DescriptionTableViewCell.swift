//
//  DescriptionTableViewCell.swift
//  BucketList
//
//  Created by Park, Subin on 1/15/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

	@IBOutlet weak var logo: UIImageView!
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var titleDescription: UITextView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
