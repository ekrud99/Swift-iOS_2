//
//  ViewController.swift
//  reviewEx01
//
//  Created by 최다경 on 2022/03/20.
//

import UIKit

class ViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.mainVC = self
    }

    func gotoLyricsView(){
        let lyricsVC = self.storyboard?.instantiateViewController(withIdentifier: "LyricsVC") as! LyricsViewController
        self.navigationController?.pushViewController(lyricsVC, animated: true)
    }

}

