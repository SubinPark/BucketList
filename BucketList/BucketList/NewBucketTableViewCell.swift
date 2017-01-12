//
//  NewBucketTableViewCell.swift
//  BucketList
//
//  Created by Park, Subin on 1/11/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit

class NewBucketTableViewCell: UITableViewCell {

	@IBOutlet weak var cardView: UIImageView!
	@IBOutlet weak var titleTextField: UITextField!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	override func layoutSubviews() {
		cardSetup()
	}
	
	func cardSetup() {
		self.cardView.alpha = 1
		self.cardView.layer.masksToBounds = false
		self.cardView.layer.cornerRadius = 1 // if you like rounded corners
		self.cardView.layer.shadowOffset = CGSize(width: CGFloat.init(-0.2), height: CGFloat.init(0.2)) //%%% this shadow will hang slightly down and to the right
		self.cardView.layer.shadowRadius = 1 //%%% I prefer thinner, subtler shadows, but you can play with this
		self.cardView.layer.shadowOpacity = 0.2 //%%% same thing with this, subtle is better for me
		
		//%%% This is a little hard to explain, but basically, it lowers the performance required to build shadows.  If you don't use this, it will lag
		self.cardView.layer.shadowPath = UIBezierPath.init(rect: self.cardView.bounds).cgPath
		self.backgroundColor = UIColor.init(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 1)
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
