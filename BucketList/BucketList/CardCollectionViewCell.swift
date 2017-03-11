//
//  CardCollectionViewCell.swift
//  BucketList
//
//  Created by Park, Subin on 3/8/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
	
	override init(frame: CGRect) {
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setup() {
		/*
		UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
		view.backgroundColor = [MMUserInterfaceConstants cardBackgroundColor];
		[self.contentView addSubview:view];
		
		view.layer.borderColor = [MMUserInterfaceConstants cardOuterBorderColor].CGColor;
		view.layer.borderWidth = MMCardOuterBorderWidth;
		
		view.layer.shadowColor = [MMUserInterfaceConstants cardOuterBorderColor].CGColor;
		view.layer.shadowOffset = CGSizeMake(MMCardShadowOffsetX, MMCardShadowOffsetY);
		view.layer.shadowRadius = 1.0f;
		view.layer.shadowOpacity = 0.9;
		
		view.translatesAutoresizingMaskIntoConstraints = NO;
		
		NSDictionary *metrics = @{@"horizontalMargin":@(MMCardLeftAndRightMargin), @"verticalMargin":@(MMCardTopBottomMargin)};
		
		NSString *horizontalRule = @"|-horizontalMargin-[view]-horizontalMargin-|";
		NSString *verticalRule = @"V:|-verticalMargin-[view]-verticalMargin-|";
		NSDictionary *views = NSDictionaryOfVariableBindings(view);
		[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:horizontalRule options:0 metrics:metrics views:views]];
		[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:verticalRule options:0 metrics:metrics views:views]];
		
		self.cardContentView = view;
		*/
		
		//let view = UIView.init()
		//self.contentView.addSubview(view)
	}
	
}
