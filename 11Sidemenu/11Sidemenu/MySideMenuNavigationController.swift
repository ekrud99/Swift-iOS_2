//
//  MySideMenuNavigationController.swift
//  11Sidemenu
//
//  Created by 최다경 on 2022/03/06.
//

import UIKit
import SideMenu

class MySideMenuNavigationController: SideMenuNavigationController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.mySidemenu = self
        
        //설정 변경
        self.menuWidth = 320
        self.leftSide = false
        self.presentationStyle = .menuSlideIn
        
    }
    

    

}
