//
//  BucketDetail.swift
//  BucketList
//
//  Created by Park, Subin on 2/7/17.
//  Copyright © 2017 subin. All rights reserved.
//

import Foundation

class BucketDetail {
	var detailTitle: String?
	var detailDescription: String?
	var created: NSDate?
	
	init(title: String?, description: String?) {
		detailTitle = title
		detailDescription = description
		created = NSDate()
	}
}
