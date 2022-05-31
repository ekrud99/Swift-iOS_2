//
//  CollectionViewController.swift
//  reviewEx01
//
//  Created by 최다경 on 2022/03/22.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "myCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        //collectionviewcell의 identifier 등록해줘야함
        cell.artisImageView?.image = UIImage(named: appDelegate.images[indexPath.row])
        cell.labelName?.text = appDelegate.names[indexPath.row]
        cell.labelArt?.text = appDelegate.arts[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate.names.count
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("item selected", indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((180)), height: CGFloat(180))
    }
}
