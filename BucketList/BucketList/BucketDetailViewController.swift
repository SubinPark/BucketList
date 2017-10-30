//
//  BucketDetailViewController.swift
//  BucketList
//
//  Created by Park, Subin on 1/16/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit
import RealmSwift

class BucketDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	@IBOutlet weak var tableView: UITableView!

	var detailedBucket: BucketRealm?
	var allDetails = List<BucketDetailsRealm>() {
		didSet {
			tableView.reloadData()
		}
	}
	var color = UIColor.Sky
	
	let imgPickerController = UIImagePickerController()
	
	let realm = try! Realm()
	
	enum DetailCellType {
		case header
		case photo
		case location
		case text
	}
	
	//Initializer with bucket object
	init(bucket: BucketRealm) {
		super.init(nibName: "BucketDetailViewController", bundle: nil)
		detailedBucket = bucket
		allDetails = bucket.details
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setUpTableView()
		setUpNavigation()		
		setToolBar()
		setBackgroundColor()
		imgPickerController.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: View Set Up
	
	func setUpTableView() {
		tableView.register(UINib.init(nibName: "BucketTableViewCell", bundle: nil), forCellReuseIdentifier: "BucketTableViewCell")
		tableView.register(UINib.init(nibName: "PhotoDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoDetailTableViewCell")
		
		tableView.dataSource = self
		tableView.delegate = self
	}
	
	func setUpNavigation() {
		self.navigationItem.title = ""
		self.navigationItem.rightBarButtonItem = nil
		self.navigationController?.navigationBar.topItem?.title = ""
	}
	
	func setBackgroundColor() {
		var frame = self.tableView.bounds
		frame.origin.y = -frame.size.height
		frame.size.height = frame.size.height
		frame.size.width = view.frame.size.width
		let backgroundView = UIView(frame: frame)
		backgroundView.backgroundColor = color
		self.tableView.addSubview(backgroundView)
	}
	
	func setToolBar() {
		navigationController?.isToolbarHidden = false
		navigationController?.toolbar.layer.borderWidth = 1
		navigationController?.toolbar.layer.borderColor = UIColor.white.cgColor
		navigationController?.toolbar.barStyle = .blackTranslucent
		navigationController?.toolbar.barTintColor = UIColor.white
		navigationController?.toolbar.tintColor = UIColor.Grey1
		
		let space = UIBarButtonItem(title: "      ", style: .plain, target: nil, action: nil) // Find a more elegant way?
		let image = UIBarButtonItem(image: UIImage.init(named: "icn_toolbar_image"), style: .plain, target: self, action: #selector(imageToolbarTapped))
		let text = UIBarButtonItem(image: UIImage.init(named: "icn_toolbar_text"), style: .plain, target: nil, action: nil)
		let location = UIBarButtonItem(image: UIImage.init(named: "icn_toolbar_location"), style: .plain, target: nil, action: nil)
		
		setToolbarItems([image, space, text, space, location], animated: true)
	}


	@objc func imageToolbarTapped() {
		let alert = UIAlertController(title: "Choose", message: nil, preferredStyle: .actionSheet)
		alert.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: { [weak self] (action) in
			if UIImagePickerController.isSourceTypeAvailable(.camera) {
				self?.imgPickerController.sourceType = .camera
				self?.imgPickerController.allowsEditing = false
				self?.present((self?.imgPickerController)!, animated: true, completion: nil)
			}
		}))
		
		alert.addAction(UIAlertAction(title: "Choose from library", style: .default, handler: { [weak self] (action) in
			if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
				self?.imgPickerController.sourceType = .photoLibrary
				self?.imgPickerController.allowsEditing = false
				self?.present((self?.imgPickerController)!, animated: true, completion: nil)
			}
		}))
		
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
	
	
	// MARK: UITableViewDataSource
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.row {
		case 0:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "BucketTableViewCell") as? BucketTableViewCell else { return UITableViewCell() }
			
			cell.titleLabel.text = detailedBucket?.bucketTitle
			cell.dateLabel.text = detailedBucket?.created.toStringWeeddayMonthDay()
			cell.backgroundColor = color
			return cell
		default:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoDetailTableViewCell") as? PhotoDetailTableViewCell else { return UITableViewCell() }
			cell.setUpCellWith(image: "TestFood", date: Date())
			return cell
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return allDetails.count + 3 //TEST
	}
	
	// MARK: UITableViewDelegate
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 200
	}
	
//	func addDetail() {
//		allDetails.insert(BucketDetail(title: "", description: "", isNew: true), at: 0)
//	}
	
	func saveBucketDetail(_ bucketDetail: BucketDetail) {
		let detailToAdd = BucketDetailsRealm(id: bucketDetail.detailID, title: bucketDetail.detailTitle, description: bucketDetail.detailDescription)
		
		try! realm.write {
			detailedBucket?.details.insert(detailToAdd, at: 0)
		}
	}
	
	func editBucketDetail(cellData: BucketDetail) {
		let bucketDetailRealm = realm.object(ofType: BucketDetailsRealm.self, forPrimaryKey: cellData.detailID)
		
		try! realm.write {
			bucketDetailRealm?.detailTitle = cellData.detailTitle
			bucketDetailRealm?.detailDescription = cellData.detailDescription
		}
	}
	
	func deleteBucketDetail(cellData: BucketDetail) {
		var counter = 0
		for detail in allDetails {
			if detail.detailID == cellData.detailID {
				allDetails.remove(at: counter)
				break
			}
			counter += 1
		}
		
		if let bucketDetailRealm = realm.object(ofType: BucketDetailsRealm.self, forPrimaryKey: cellData.detailID) {
			try! realm.write {
				realm.delete(bucketDetailRealm)
			}
		}
		
		tableView.reloadData()
	}
	
	// MARK: UIImagePickerControllerDelegate Methods
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
			//addDetail()
			//imageView.contentMode = .ScaleAspectFit
			//imageView.image = pickedImage
		}
		
		dismiss(animated: true, completion: nil)
	}
}
