//
//  MyTableViewController.swift
//  reviewEx01
//
//  Created by 최다경 on 2022/03/23.
//

import UIKit

class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

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
        cell.labelArtist.text = names[indexPath.row]
        
        cell.selectionStyle = .none
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 셀의 위치(section): ", indexPath.section)
        print("선택된 셀의 위치(row): ", indexPath.row)
        switch indexPath.row{
        case 0:
            let newVC = self.storyboard?.instantiateViewController(withIdentifier: "art") as! artViewController
            appDelegate.ytUrl = "eHir_vB1RUI"
            self.navigationController?.pushViewController(newVC, animated: true)
        case 1:
            let newVC = self.storyboard?.instantiateViewController(withIdentifier: "art") as! artViewController
            appDelegate.ytUrl = "sqgxcCjD04s"
            self.navigationController?.pushViewController(newVC, animated: true)
        case 2:
            let newVC = self.storyboard?.instantiateViewController(withIdentifier: "art") as! artViewController
            appDelegate.ytUrl = "WPdWvnAAurg"
            self.navigationController?.pushViewController(newVC, animated: true)
        case 3:
            let newVC = self.storyboard?.instantiateViewController(withIdentifier: "art") as! artViewController
            appDelegate.ytUrl = "NaFd8ucHLuo"
            self.navigationController?.pushViewController(newVC, animated: true)
        case 4:
            let newVC = self.storyboard?.instantiateViewController(withIdentifier: "art") as! artViewController
            appDelegate.ytUrl = "gset79KMmt0"
            self.navigationController?.pushViewController(newVC, animated: true)
        default:
            return
            
        }
    }

    

}
