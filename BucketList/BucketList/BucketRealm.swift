//
//  BucketRealm.swift
//  BucketList
//
//  Created by Park, Subin on 1/31/17.
//  Copyright © 2017 subin. All rights reserved.
//

import Foundation
import RealmSwift

final class BucketRealm: Object {
	dynamic var id = ""
	dynamic var bucketTitle = ""
	dynamic var bucketDescription = ""
	dynamic var finished = false
	dynamic var created = Date()
	let details = List<BucketDetailsRealm>()
	
	convenience init(title: String, description: String) {
		self.init()
		bucketTitle = title
		bucketDescription = description
	}
	
	convenience init(title: String) {
		self.init()
		bucketTitle = title
	}
}
