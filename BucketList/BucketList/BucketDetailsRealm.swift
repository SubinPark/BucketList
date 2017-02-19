//
//  BucketDetailsRealm.swift
//  BucketList
//
//  Created by Park, Subin on 2/5/17.
//  Copyright © 2017 subin. All rights reserved.
//

import Foundation
import RealmSwift

final class BucketDetailsRealm: Object {
	dynamic var detailID = 0
	dynamic var detailTitle = ""
	dynamic var detailDescription = ""
	dynamic var created = NSDate()
	
	convenience init(id: Int, title: String, description: String) {
		self.init()
		detailID = id
		detailTitle = title
		detailDescription = description
	}
	
	override static func primaryKey() -> String? {
		return "detailID"
	}
	
	static func IncrementedID() -> Int {
		let realm = try! Realm()
		let bucketDetails: NSArray = Array(realm.objects(BucketDetailsRealm.self).sorted(byKeyPath: "detailID")) as NSArray
		
		if bucketDetails.count > 0 {
			if let lastBucketDetail = bucketDetails.lastObject as? BucketDetailsRealm {
				return lastBucketDetail.detailID + 1
			}
		}
		return 1
	}
}
