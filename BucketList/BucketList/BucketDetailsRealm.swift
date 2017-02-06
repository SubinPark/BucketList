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
	dynamic var detailTitle = ""
	dynamic var detailDescription = ""
	dynamic var created = NSDate()
	
	convenience init(title: String, description: String) {
		self.init()
		detailTitle = title
		detailDescription = description
	}
}
