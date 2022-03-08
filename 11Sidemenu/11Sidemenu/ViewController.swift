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
        
        appDelegate.mainVC = self
        
    }

    func gotoLoginView() {
        //네비게이션 컨트롤러로 이동하기
        let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }

    func gotoNoticeView() {
        //네비게이션 컨트롤러로 이동하기
        let noticeVC = self.storyboard?.instantiateViewController(identifier: "NoticeVC") as! NoticeViewController
        self.navigationController?.pushViewController(noticeVC, animated: true)
    }
}

import SideMenu

extension ViewController: SideMenuNavigationControllerDelegate {
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        print("sideMenuWillAppear")
    }
    func sideMenuDidAppear(menu: SideMenuNavigationController, animated: Bool) {
        print("sideMenuDidAppear")
    }
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        print("sideMenuWillDisappear")
    }
    func sideMenuDidDisappear(menu: SideMenuNavigationController, animated: Bool) {
        print("sideMenuDidDisappear")
    }
}
