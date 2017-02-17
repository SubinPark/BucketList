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
	var id: String?
	var detailTitle: String
	var detailDescription: String
	var detailIsNew: Bool
	var created: NSDate
	
	init(title: String = "", description: String = "", isNew: Bool = true) {
		id = UUID().uuidString
		detailTitle = title
		detailDescription = description
		detailIsNew = isNew
		created = NSDate()
	}
	
	//TODO: Figure out how to use this incremented ID in init. Change id to Int
//	func IncrementedID() -> Int {
//		let realm = try! Realm()
//		let bucketDetails: NSArray = Array(realm.objects(BucketDetail).sorted("id"))
//		let last = bucketDetails.lastObject
//		if bucketDetails.count > 0 {
//			if let value = last.valueForKey("id") as? Int {
//				return value + 1
//			}
//		} else {
//			return 1
//		}
//	}
}
