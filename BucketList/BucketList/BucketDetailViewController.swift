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

	var detailedBucket: BucketRealm?
	var allDetails = [BucketDetail]()
	
	let realm = try! Realm()
	
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
		
		//Transferring Realm objects to Swift objects
		let realmDetails = realm.objects(BucketDetailsRealm.self)
		for detail in realmDetails {
			allDetails.append(BucketDetail(id: detail.detailID, title: detail.detailTitle, description: detail.detailDescription, isNew: false))
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: UITableViewDataSource
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell") as! DescriptionTableViewCell
		cell.cellData = allDetails[indexPath.row]
		cell.dataSetup()
		cell.delegate = self
		cell.row = indexPath.row
		
		if let isNew = cell.cellData?.detailIsNew, isNew == true {
			cell.editButton.isHidden = true
			cell.saveButton.isHidden = false
		} else {
			cell.title.isUserInteractionEnabled = false
			cell.titleDescription.isUserInteractionEnabled = false
			cell.editButton.isHidden = false
			cell.saveButton.isHidden = true
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return allDetails.count
	}
	
	// MARK: UITableViewDelegate
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 255
	}
	
	func addDetail() {
		allDetails.append(BucketDetail(title: "", description: "", isNew: true))
		tableView.reloadData()
	}
	
	func saveBucketDetail(_ bucketDetail: BucketDetail) {
		let detailToAdd = BucketDetailsRealm(id: bucketDetail.detailID, title: bucketDetail.detailTitle, description: bucketDetail.detailDescription)
		
		try! realm.write {
			realm.add(detailToAdd)
		}
	}
	
	func editBucketDetail(cellData: BucketDetail) {
		let bucketDetailRealm = realm.object(ofType: BucketDetailsRealm.self, forPrimaryKey: cellData.detailID)
		
		try! realm.write {
			bucketDetailRealm?.detailTitle = cellData.detailTitle
			bucketDetailRealm?.detailDescription = cellData.detailDescription
		}
	}
}
