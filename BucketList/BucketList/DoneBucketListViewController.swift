//
//  ViewController.swift
//  BucketList
//
//  Created by Park, Subin on 1/1/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit

class DoneBucketListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	var doneBuckets: [Bucket] = []
	
	@IBOutlet weak var doneBucketTableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.doneBucketTableView.register(UINib.init(nibName: "BucketTableViewCell", bundle: nil), forCellReuseIdentifier: "BucketTableViewCell")
		self.doneBucketTableView.dataSource = self
		self.doneBucketTableView.delegate = self
		
		temporaryDataSetup()
	}
	
	func temporaryDataSetup() {
		doneBuckets.append(Bucket.init(title: "Pottery", color: .blue))
		doneBuckets.append(Bucket.init(title: "Ballet", color: .red))
		doneBuckets.append(Bucket.init(title: "Read a book", color: .green))
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: UITableViewDataSource
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return doneBuckets.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "BucketTableViewCell", for: indexPath) as! BucketTableViewCell
		cell.label.text = doneBuckets[indexPath.row].bucketTitle
		cell.backgroundImage.backgroundColor = doneBuckets[indexPath.row].bucketColor
		return cell
	}
	
	// MARK: UITableViewDelegate
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return CGFloat.init(100)
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

