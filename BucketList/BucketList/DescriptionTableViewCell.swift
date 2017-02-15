//
//  DescriptionTableViewCell.swift
//  BucketList
//
//  Created by Park, Subin on 1/15/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

	@IBOutlet weak var cardView: UIView!
	@IBOutlet weak var title: UITextField!
	@IBOutlet weak var titleDescription: UITextView!
	@IBOutlet weak var saveButton: UIButton!
	@IBOutlet weak var editButton: UIButton!
	
	var delegate: BucketDetailViewController?
	var cellData: BucketDetail?
	var row: Int?
	var isNew: Bool = true
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
		self.backgroundColor = UIColor.init(colorLiteralRed: 240 / 255, green: 240 / 255, blue: 240 / 255, alpha: 1)
	}
	
	func dataSetup() {
		title.text = cellData?.detailTitle
		titleDescription.text = cellData?.detailDescription
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	@IBAction func saveButtonClicked(_ sender: Any) {
		title.isUserInteractionEnabled = false
		titleDescription.isUserInteractionEnabled = false
		saveButton.isHidden = true
		editButton.isHidden = false
		
		self.delegate?.saveBucketDetail(BucketDetail.init(title: title.text, description: titleDescription.text, isNew: false), row: row!)
		
		
//		if (self.isNew) {
//		} else {
//			self.delegate?.editBucketDetail(row: row!)
//		}
	}
	
	@IBAction func editButtonClicked(_ sender: Any) {
		title.isUserInteractionEnabled = true
		titleDescription.isUserInteractionEnabled = true
		editButton.isHidden = true
		saveButton.isHidden = false
	}
	
}
