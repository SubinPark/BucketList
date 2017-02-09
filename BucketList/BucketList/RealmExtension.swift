//
//  RealmExtension.swift
//  BucketList
//
//  Created by Park, Subin on 2/8/17.
//  Copyright © 2017 subin. All rights reserved.
//

import Foundation

extension Realm {
	//nextID = (int) (realm.where(dbObj.class).maximumInt("id") + 1)
	
	func getNextID() -> Int { //TODO
		return 1
	}
}
