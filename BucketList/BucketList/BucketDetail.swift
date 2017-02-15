//
//  BucketDetail.swift
//  BucketList
//
//  Created by Park, Subin on 2/7/17.
//  Copyright © 2017 subin. All rights reserved.
//

import Foundation

class BucketDetail {
	var id: String?
	var detailTitle: String?
	var detailDescription: String?
	var detailIsNew: Bool?
	var created: NSDate?
	
	init(title: String?, description: String?, isNew: Bool?) {
		detailTitle = title
		detailDescription = description
		detailIsNew = isNew
		created = NSDate()
	}
}
