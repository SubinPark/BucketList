//
//  UIColor.swift
//  BucketList
//
//  Created by Park, Subin on 7/4/17.
//  Copyright © 2017 subin. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
	static var Sky : UIColor {get{return UIColor.colorFromHex(0x99D8F7)}}
	static var Sky2 : UIColor {get{return UIColor.colorFromHex(0x72A0B8)}}
	static var Flower : UIColor {get{return UIColor.colorFromHex(0xFFB8B8)}}
	static var Flower2 : UIColor {get{return UIColor.colorFromHex(0xC28C8C)}}
	static var Dust : UIColor {get{return UIColor.colorFromHex(0xD4D783)}}
	static var Dust2 : UIColor {get{return UIColor.colorFromHex(0xA4A665)}}
	static var Sand : UIColor {get{return UIColor.colorFromHex(0xD4C6B8)}}
	static var Sand2 : UIColor {get{return UIColor.colorFromHex(0xA1968C)}}
	static var Grey1 : UIColor {get{return UIColor.colorFromHex(0x9B9B9B)}}
	static var Black : UIColor {get{return UIColor.colorFromHex(0x1C1C1C)}}
	static var White : UIColor {get{return UIColor.colorFromHex(0xFFFFFF)}}
	
	static func colorFromHex(_ rgbValue:UInt32)->UIColor{
		let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
		let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
		let blue = CGFloat(rgbValue & 0xFF)/256.0
		return UIColor(red:red, green:green, blue:blue, alpha:1.0)
	}
}
