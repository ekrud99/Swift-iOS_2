//
//  ViewController.swift


import UIKit
import AVKit//apple native sdk

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func palyMovie(url: NSURL){
        let palyController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        palyController.player = player
        self.present( palyController, animated: true){
            player.play()
        }
    }
    
    @IBAction func onBtnPlayerInner(_ sender: UIButton) {//내부 파일 동영상 재생
        let filepath: String? = Bundle.main.path(forResource: "Video1", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filepath!)
        palyMovie(url: url)
    }
    @IBAction func onBtnPlayLink(_ sender: UIButton) {//외부 링크 동영상 재생
        let url = NSURL(string: "http://nissisoft21.dothome.co.kr/Video1.mp4")
        palyMovie(url: url!)
    }
    @IBAction func onBtnPlayYoutube(_ sender: UIButton) {
    }
    

}

