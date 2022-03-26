//
//  SidemenuViewController.swift
//  reviewEx01
//
//  Created by 최다경 on 2022/03/26.
//

import UIKit

class SidemenuViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func onBtnLyrics(_ sender: UIButton) {
        appDelegate.mySidemenu?.dismiss(animated: true, completion: nil)//사이드메뉴 닫기
        //main -> lyrics
        appDelegate.mainVC?.gotoLyricsView()
    }
    
   

}
