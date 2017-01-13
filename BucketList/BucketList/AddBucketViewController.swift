//
//  AddBucketViewController.swift
//  BucketList
//
//  Created by Park, Subin on 1/12/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit

class AddBucketViewController: UIViewController, UITextViewDelegate {
	@IBOutlet weak var bucketName: UITextView!
	@IBOutlet weak var bucketDescription: UITextView!
	@IBOutlet weak var addButton: UIButton!
	
	var bucketListDelegate: UIViewController?
	
    override func viewDidLoad() {
        super.viewDidLoad()

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
		bucketListDelegate?.dismiss(animated: true, completion: nil)
	}
	
	func textViewDidBeginEditing(_ textView: UITextView) {
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
