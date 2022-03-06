//
//  SidemenuViewController.swift
//  11Sidemenu
//
//  Created by 최다경 on 2022/03/06.
//

import UIKit

class SidemenuViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func onBtnLogin(_ sender: UIButton) {
        //사이드메뉴 닫기
        appDelegate.mySidemenu?.dismiss(animated: true, completion: nil)
        //메인화면에서 로그인화면으로 이동하기
        appDelegate.mainVC?.gotoLoginView()
    }
    
    @IBAction func onBtnNotice(_ sender: UIButton) {
        appDelegate.mySidemenu?.dismiss(animated: true, completion: nil)
        //메인화면에서 공지화면으로 이동하기
        appDelegate.mainVC?.gotoNoticeView()
    }
    
}
