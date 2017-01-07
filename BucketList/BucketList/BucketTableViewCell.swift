//
//  BucketTableViewCell.swift
//  BucketList
//
//  Created by Park, Subin on 1/6/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit

class BucketTableViewCell: UITableViewCell {
	@IBOutlet weak var backgroundImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func setBackgroundImage(image: UIImage) {
		backgroundImage.image = image
	}
    
}
