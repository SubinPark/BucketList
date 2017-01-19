//
//  UIViewControllerExtension.swift
//  BucketList
//
//  Created by Park, Subin on 1/18/17.
//  Copyright © 2017 subin. All rights reserved.
//
import UIKit

extension UIViewController {
	func hideKeyboardWhenTappedAround() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
		view.addGestureRecognizer(tap)
	}
	
	func dismissKeyboard() {
		view.endEditing(true)
	}
}
