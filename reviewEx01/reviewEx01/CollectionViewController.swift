//
//  CollectionViewController.swift
//  reviewEx01
//
//  Created by 최다경 on 2022/03/22.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    let names:[String] = ["TaeYeon", "IU", "AESPA", "GAYLE", "Sia"]
    let arts:[String] = ["Rain", "Strawberry Moon", "Savage", "abcdefu", "Snowman"]
    let images:[String] = ["image2", "image3", "image4", "image5", "image6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "myCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        //collectionviewcell의 identifier 등록해줘야함
        cell.artisImageView?.image = UIImage(named: images[indexPath.row])
        cell.labelName?.text = names[indexPath.row]
        cell.labelArt?.text = arts[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("item selected", indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((180)), height: CGFloat(180))
    }
}
