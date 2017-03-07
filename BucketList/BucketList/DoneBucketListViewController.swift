//
//  ViewController.swift
//  BucketList
//
//  Created by Park, Subin on 1/1/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit
import RealmSwift

class DoneBucketListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	var doneBuckets: [Bucket] = []
	var tableViewType: Enums.TableViewType = .DoneList
	
	let realm = try! Realm()
	
	var buckets: Results<BucketRealm> {
		get {
			return realm.objects(BucketRealm.self).sorted(byKeyPath: "created", ascending: false)
		}
	}

	@IBOutlet weak var doneBucketTableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.doneBucketTableView.register(UINib.init(nibName: "BucketTableViewCell", bundle: nil), forCellReuseIdentifier: "BucketTableViewCell")
		self.doneBucketTableView.register(UINib.init(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DescriptionTableViewCell")
		self.doneBucketTableView.dataSource = self
		self.doneBucketTableView.delegate = self
		
		self.navigationItem.title = "Done"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(DoneBucketListViewController.addBucket))

		doneBucketTableView.backgroundColor = UIColor(colorLiteralRed: 240 / 255.0, green: 240 / 255.0, blue: 240 / 255.0, alpha: 1)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		doneBucketTableView.reloadData()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: UITableViewDataSource
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//return doneBuckets.count
		return buckets.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "BucketTableViewCell", for: indexPath) as! BucketTableViewCell
		cell.label.text = buckets[indexPath.row].bucketTitle
		
		return cell
	}
	
	// MARK: UITableViewDelegate
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return CGFloat.init(200)
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		if let cell = tableView.cellForRow(at: indexPath) as? BucketTableViewCell {
			//Experiment: Animation when clicking the card to the navigation bar
			UIView.animate(withDuration: 0.8) {
				cell.center.y -= 300
				self.navigationController?.navigationBar.barTintColor = UIColor.white
				
				//self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
				//self.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
				
				//self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black]
			}
		}

		//let controller = BucketDetailViewController(bucket: buckets[indexPath.row])
		//self.navigationController?.pushViewController(controller, animated: true)
	}
	
	// MARK: Bucket Methods
	
	func addBucket() {
		let controller = AddBucketViewController()
		controller.bucketListDelegate = self
		self.navigationController?.present(controller, animated: true, completion: nil)
	}
}

