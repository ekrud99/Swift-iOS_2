//
//  MyTableViewController.swift
//  reviewEx01
//
//  Created by 최다경 on 2022/03/23.
//

import UIKit

class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var mytableView: UITableView!
    
    let names:[String] = [
        "TaeYeon", "IU", "AESPA", "GAYLE", "Sia"
    ]
    let arts:[String] = [
        "Rain", "Strawberry Moon", "Savage", "abcdefu", "Snowman"
    ]
    let images:[String] = ["image2", "image3", "image4", "image5", "image6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mytableView.delegate = self
        mytableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.mytableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell // 메모리 위해 셀 재사용
        cell.artImageView?.image = UIImage(named: images[indexPath.row])
        cell.labelArt.text = arts[indexPath.row]
        
        cell.selectionStyle = .none
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 셀의 위치(section): ", indexPath.section)
        print("선택된 셀의 위치(row): ", indexPath.row)
    }

    

}
