//
//  BucketDetailViewController.swift
//  BucketList
//
//  Created by Park, Subin on 1/16/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit
import RealmSwift

class BucketDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet weak var tableView: UITableView!

	var allDetails = [Bucket]() //should be an array of Detail object - TODO: create a detail object
	var detailedBucket: BucketRealm?
	let realm = try! Realm()
	var details: Results<BucketDetailsRealm> {
		get {
			return realm.objects(BucketDetailsRealm.self)
		}
	}
	
	//Initializer with bucket object
	init(bucket: BucketRealm) {
		super.init(nibName: "BucketDetailViewController", bundle: nil)
		detailedBucket = bucket
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		tableView.register(UINib.init(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DescriptionTableViewCell")
		tableView.dataSource = self
		tableView.delegate = self
		
		self.navigationItem.title = detailedBucket?.bucketTitle
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(BucketDetailViewController.addDetail))
		
		tableView.backgroundColor = UIColor(colorLiteralRed: 240 / 255.0, green: 240 / 255.0, blue: 240 / 255.0, alpha: 1)
		
		
		//Getting all realm objects to details array
		let realmDetails = realm.objects(BucketDetailsRealm.self)
		for detail in realmDetails {
			allDetails.append(Bucket(title: detail.detailTitle, detail: detail.detailDescription))
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: UITableViewDataSource
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell") as! DescriptionTableViewCell
		cell.titleDescription.text = allDetails[indexPath.row].bucketDetail
		cell.delegate = self
		cell.row = indexPath.row
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return details.count
	}
	
	// MARK: UITableViewDelegate
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 255
	}
	
	func addDetail() {
		allDetails.append(Bucket.init(title: nil, detail: nil))
		
		//let detailToAdd = BucketDetailsRealm(title: "", description: "")
		
		//details.append(Bucket.init(title: nil, detail: nil))
		//details.insert(Bucket.init(title: nil, detail: nil), at: 0)
//		let realm = try! Realm()
//		try! realm.write {
//			realm.add(bucketToAdd)
//		}
		
//		try! realm.write {
//			realm.add(detailToAdd)
//		}
//		
		
		
		tableView.reloadData()
	}
	
	func saveBucket(_ bucket: Bucket , row: Int) {
		//Find the BucketDetailRealm object and fix?!
		let detailToAdd = BucketDetailsRealm(title: bucket.bucketTitle ?? "", description: bucket.bucketDetail ?? "")
		
		try! realm.write {
			realm.add(detailToAdd)
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
