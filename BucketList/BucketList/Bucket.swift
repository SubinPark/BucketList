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
		//bucketColor = color
	}
}

enum BucketColor: RawRepresentable {
	case red
	case blue
	case green
}
