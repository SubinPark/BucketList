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

        // Do any additional setup after loading the view.
		bucketName.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func addButtonDidClicked(_ sender: Any) {
		bucketListDelegate?.dismiss(animated: true, completion: nil)
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
