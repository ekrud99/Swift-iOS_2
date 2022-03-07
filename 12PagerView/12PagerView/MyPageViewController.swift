//
//  MyPageViewController.swift
//  12PagerView
//
//  Created by 최다경 on 2022/03/07.
//

import UIKit

class MyPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate.pageVC = self
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = viewcControllerList.first{
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //lazy변수: 선언시에 메모리 할당을 하지 않고, 참조 시 메모리에 할당
    lazy var viewcControllerList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(identifier: "firstVC")
        let vc2 = sb.instantiateViewController(identifier: "secondVC")
        let vc3 = sb.instantiateViewController(identifier: "thirdVC")
        
        return [vc1, vc2, vc3]
    }()
    
    //MARK: - PageView Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewcControllerList.firstIndex(of: viewController)
        else{
            return nil
        }
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else{
            return nil
        }
        return viewcControllerList[previousIndex]
    }//앞으로 갈 떄
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewcControllerList.firstIndex(of: viewController)
        else{
            return nil
        }
        let afterIndex = vcIndex + 1
        //뷰 컨트롤러 갯수와 요청한 뷰인덱스(갯수 - 1)가 같으면 널 반환
        guard viewcControllerList.count != afterIndex else{
            return nil
        }
        return viewcControllerList[afterIndex]
    }//뒤로 갈 때
    
  //코드로 초기화시 기본걸정을 할 수 있음
    required init?(coder: NSCoder){
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    //page이동이 끝났을 때 호출. didFinishAnimation
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let currentTag = pageViewController.viewControllers!.first!.view.tag
        print(currentTag)
        
        appDelegate.mainVC?.pageControl.currentPage = currentTag
    }
}
