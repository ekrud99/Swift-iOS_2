//
//  ViewController.swift
//  11Sidemenu
//
//  Created by 최다경 on 2022/03/06.
//

import UIKit

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func gotoLoginView(){
        //네비게이션 컨트롤러로 이동하기
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    func gotoNoticeView(){
        let noticeVC = self.storyboard?.instantiateViewController(withIdentifier: "NoticeVC") as! NoticeViewController
        self.navigationController?.pushViewController(noticeVC, animated: true)
        
    }

}

