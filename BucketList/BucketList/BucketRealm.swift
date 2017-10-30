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
	@objc dynamic var id = ""
	@objc dynamic var bucketTitle = ""
	@objc dynamic var bucketDescription = ""
	@objc dynamic var finished = false
	@objc dynamic var created = Date()
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
