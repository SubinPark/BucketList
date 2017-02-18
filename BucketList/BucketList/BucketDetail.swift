//
//  BucketDetail.swift
//  BucketList
//
//  Created by Park, Subin on 2/7/17.
//  Copyright © 2017 subin. All rights reserved.
//

import Foundation
import RealmSwift

class BucketDetail {
	var detailID: Int
	var detailTitle: String
	var detailDescription: String
	var detailIsNew: Bool
	var created: NSDate
	
	init(id: Int = BucketDetailsRealm.IncrementedID(), title: String = "", description: String = "", isNew: Bool = true) {
		detailID = id
		detailTitle = title
		detailDescription = description
		detailIsNew = isNew
		created = NSDate()
	}
}
