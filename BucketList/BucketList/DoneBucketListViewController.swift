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
	let colors : [UIColor] = [UIColor.Sky, UIColor.Flower, UIColor.Dust, UIColor.Sand]
	
	
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
		self.doneBucketTableView.dataSource = self
		self.doneBucketTableView.delegate = self
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icn_nav_add"), style: .plain, target: self, action: #selector(DoneBucketListViewController.addBucket))
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icn_nav_settings"), style: .plain, target: nil, action: nil)

		doneBucketTableView.backgroundColor = UIColor.white
	}
	
	override func viewWillAppear(_ animated: Bool) {
		doneBucketTableView.reloadData()
		self.navigationController?.navigationBar.barTintColor = UIColor.white
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	// MARK: UITableViewDataSource
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return buckets.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "BucketTableViewCell", for: indexPath) as! BucketTableViewCell
		cell.titleLabel.text = buckets[indexPath.row].bucketTitle
		cell.dateLabel.text = buckets[indexPath.row].created.toStringWeeddayMonthDay()
		cell.backgroundColor = colors[(indexPath.row % 4)]
		
		return cell
	}
	
	// MARK: UITableViewDelegate
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return CGFloat.init(200)
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		let controller = BucketDetailViewController(bucket: buckets[indexPath.row])
		controller.color = tableView.cellForRow(at: indexPath)?.backgroundColor ?? UIColor.Sky
		self.navigationController?.pushViewController(controller, animated: true)
		self.navigationController?.navigationBar.barTintColor = tableView.cellForRow(at: indexPath)?.backgroundColor
	}
	
	// MARK: Bucket Methods
	
	@objc func addBucket() {
		let controller = AddBucketViewController()
		controller.bucketListDelegate = self
		self.navigationController?.present(controller, animated: true, completion: nil)
	}
}

