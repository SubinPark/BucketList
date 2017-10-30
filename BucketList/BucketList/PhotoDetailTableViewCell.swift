//
//  PhotoDetailTableViewCell.swift
//  BucketList
//
//  Created by Park, Subin on 10/29/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit

class PhotoDetailTableViewCell: UITableViewCell {
	@IBOutlet weak var mainImageView: UIImageView!
	@IBOutlet weak var dot: UIImageView!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var lineView: UIView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func setUpCellWith(image imageName: String, date: Date) {
		mainImageView.image = UIImage(named: imageName)
		dateLabel.text = date.toString(dateFormat: "MMM d")
		dateLabel.textColor = UIColor.LabelGray
	}
    
}
