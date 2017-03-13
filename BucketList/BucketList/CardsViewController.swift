//
//  CardsViewController.swift
//  BucketList
//
//  Created by Park, Subin on 3/7/17.
//  Copyright © 2017 subin. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	var cards: [UIViewController] = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

		collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCollectionViewCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cards.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		//TODO: Create a collection view cell that will contain UIViewController. Or transferring controller to the cell container.
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as? CardCollectionViewCell {
			cell.transferFromViewController(controller: cards[indexPath.row])
			//Any protocol for UIViewController cards?
			
			return cell
		}
		
		return UICollectionViewCell()
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
