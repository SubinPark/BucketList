//
//  BucketTableViewCell.swift
//  BucketList
//
//  Created by Park, Subin on 7/4/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit

class BucketTableViewCell: UITableViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
