//
//  NSDateExtension.swift
//  BucketList
//
//  Created by Park, Subin on 7/29/17.
//  Copyright © 2017 subin. All rights reserved.
//
import Foundation
import UIKit

extension Date
{
	func toStringWeeddayMonthDay() -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "EEEE MMMM dd"
		return dateFormatter.string(from: self).localizedUppercase
	}
	
	func toString(dateFormat format : String ) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = format
		return dateFormatter.string(from: self)
	}
	
}
