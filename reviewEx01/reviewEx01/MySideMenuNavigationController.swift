//
//  MySideMenuNavigationController.swift
//  reviewEx01
//
//  Created by 최다경 on 2022/03/24.
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
        self.leftSide = true
        self.presentationStyle = .menuSlideIn
        
    }
    
    
    

}
