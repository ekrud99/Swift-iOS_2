//
//  ViewController.swift
//  12PagerView
//
//  Created by 최다경 on 2022/03/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.mainVC = self
    }


}

