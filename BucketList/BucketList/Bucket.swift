//
//  Bucket.swift
//  BucketList
//
//  Created by Park, Subin on 1/8/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit

class Bucket {
	var bucketTitle: String?
	var bucketColor: UIColor?
	
	init(title: String?, color: BucketColor) {
		bucketTitle = title
		bucketColor = color.rawValue
	}
}

enum BucketColor {
	case red
	case blue
	case green
}

extension BucketColor: RawRepresentable {
	typealias RawValue = UIColor
	
	init?(rawValue: BucketColor.RawValue) {
		switch rawValue {
		case UIColor.red:
			self = .red
		case UIColor.blue:
			self = .blue
		case UIColor.green:
			self = .green
		default:
			return nil
		}
	}
	
	var rawValue: RawValue {
		switch self {
		case .red: return UIColor.red
		case .blue: return UIColor.blue
		case .green: return UIColor.green
		}
	}
}

