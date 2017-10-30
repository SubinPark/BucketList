//
//  DetailItem.swift
//  BucketList
//
//  Created by Park, Subin on 9/16/17.
//  Copyright © 2017 subin. All rights reserved.
//

import Foundation

protocol DetailItem {
	var detialID: Int { get set }
	var dateCreated: NSDate { get set }
}

struct ImageItem: DetailItem {
	var detialID: Int
	var dateCreated: NSDate
	
//	init(<#parameters#>) {
//		<#statements#>
//	}
}

struct LocationItem: DetailItem {
	var detialID: Int
	var dateCreated: NSDate
}

struct TextItem: DetailItem {
	var detialID: Int
	var dateCreated: NSDate
}
