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
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var bucketName: UITextView!
	@IBOutlet weak var bucketDescription: UITextView!
	@IBOutlet weak var addButton: UIButton!
	
	var bucketListDelegate: UIViewController?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		UISetup()
		hideKeyboardWhenTappedAround()
    }
	
	func UISetup() {
		bucketName.delegate = self
		bucketName.text = "What do you want to accomplish?"
		bucketName.textColor = UIColor.lightGray
		
		bucketDescription.delegate = self
		bucketDescription.text = "Let's get specific."
		bucketDescription.textColor = UIColor.lightGray
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func addButtonDidClicked(_ sender: Any) {
		let listController = bucketListDelegate as? DoneBucketListViewController
		//listController?.doneBuckets.append(Bucket(title: bucketName.text, detail: bucketDescription.text))
		bucketListDelegate?.dismiss(animated: true, completion: nil)
		
		let bucketToAdd = BucketRealm.init(title: bucketName.text, description: bucketDescription.text)
		
		let realm = try! Realm()
		try! realm.write {
			realm.add(bucketToAdd)
		}
	}
	
	func textViewDidBeginEditing(_ textView: UITextView) {
		scrollView.setContentOffset(CGPoint.init(x: 0, y: (textView.frame.origin.y - CGFloat.init(30))), animated: true)
		if textView.textColor == UIColor.lightGray {
			switch textView {
			case bucketName:
				bucketName.text = nil
				bucketName.textColor = UIColor.black
			case bucketDescription:
				bucketDescription.text = nil
				bucketDescription.textColor = UIColor.black
			default: break
			}
		}
	}
	
	func textViewDidEndEditing(_ textView: UITextView) {
		scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: true)
		if textView.text.isEmpty {
			switch textView {
			case bucketName:
				bucketName.text = "What do you want to accomplish?"
				bucketName.textColor = UIColor.lightGray
			case bucketDescription:
				bucketDescription.text = "Let's get specific."
				bucketDescription.textColor = UIColor.lightGray
			default: break
			}
		}
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
