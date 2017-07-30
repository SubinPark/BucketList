//
//  AddBucketViewController.swift
//  BucketList
//
//  Created by Park, Subin on 1/12/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit
import RealmSwift

class AddBucketViewController: UIViewController, UITextViewDelegate {
	@IBOutlet weak var topView: UIView!
	@IBOutlet weak var bottomView: UIView!
	@IBOutlet weak var titleTextView: UITextView!
	@IBOutlet weak var characterLimitLabel: UILabel!
	
	var bucketListDelegate: UIViewController?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		UISetup()
		hideKeyboardWhenTappedAround()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		titleTextView.becomeFirstResponder()
	}
	
	func UISetup() {
		titleTextView.text = ""
		topView.backgroundColor = UIColor.Sky
		bottomView.backgroundColor = UIColor.Sky
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//	
//	@IBAction func addButtonDidClicked(_ sender: Any) {
//
//	}
//	
//	func textViewDidBeginEditing(_ textView: UITextView) {
//		scrollView.setContentOffset(CGPoint.init(x: 0, y: (textView.frame.origin.y - CGFloat.init(30))), animated: true)
//		if textView.textColor == UIColor.lightGray {
//			switch textView {
//			case bucketName:
//				bucketName.text = nil
//				bucketName.textColor = UIColor.black
//			case bucketDescription:
//				bucketDescription.text = nil
//				bucketDescription.textColor = UIColor.black
//			default: break
//			}
//		}
//	}
//	
//	func textViewDidEndEditing(_ textView: UITextView) {
//		scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: true)
//		if textView.text.isEmpty {
//			switch textView {
//			case bucketName:
//				bucketName.text = "What do you want to accomplish?"
//				bucketName.textColor = UIColor.lightGray
//			case bucketDescription:
//				bucketDescription.text = "Let's get specific."
//				bucketDescription.textColor = UIColor.lightGray
//			default: break
//			}
//		}
//	}
	
	@IBAction func confirmAction(_ sender: Any) {
		bucketListDelegate?.dismiss(animated: true, completion: nil)
		
		let bucketToAdd = BucketRealm.init(title: titleTextView.text)
		
		let realm = try! Realm()
		try! realm.write {
			realm.add(bucketToAdd)
		}
	}
	
	
	@IBAction func deleteAction(_ sender: Any) {
	}
	
	
}
