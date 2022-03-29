//
//  artViewController.swift
//  reviewEx01
//
//  Created by 최다경 on 2022/03/27.
//

import UIKit
import youtube_ios_player_helper

class artViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var youtubePlayer: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let id: String = appDelegate.ytUrl!
        self.youtubePlayer.load(withVideoId: id)
        //id: url 중 v= 뒤의 주소
        
    }
    

    

}
