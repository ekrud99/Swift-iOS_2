//
//  MusicViewController.swift
//  reviewEx01
//
//  Created by 최다경 on 2022/03/21.
//

import UIKit
import AVFoundation

class MusicViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var labelEndTime: UILabel!
    @IBOutlet weak var lebelCrtTime: UILabel!
    
    var audioPlayer: AVAudioPlayer!
    var audioFile: URL!
    var timer: Timer?
    var cnt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cnt = 0
        selectAudioFile()
        initPlayer()
        
    }
    
    
    func selectAudioFile(){
        audioFile = Bundle.main.url(forResource: "music1", withExtension: "mp3")
    }
    
    func initPlayer(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)//예외 발생 시 catch로 예외 정보와 함께 던짐
        }catch let error as NSError{
            print("error init player", error)
        }
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()//메모리에 음원 넣는 작업
        audioPlayer.volume = 1.0
        
        lebelCrtTime.text = "0:00"
            let min = Int(audioPlayer.duration / 60)
            let sec = Int(audioPlayer.duration) % 60
            labelEndTime.text = "\(min):\(sec)"//총 재생 시간 표시
            
            //ui init
            progressView.progress = 0
            btnPlay.isEnabled = true
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(callbackTimer), userInfo: nil, repeats: true)
            
        
    }
    
    @objc func callbackTimer(){
        let min = Int(audioPlayer.currentTime / 60)
        let sec = Int(audioPlayer.currentTime) % 60
        lebelCrtTime.text = "\(min):\(sec)"
        
        progressView.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    @IBAction func onBtnPlay(_ sender: UIButton) {
        cnt += 1
        print("cnt: \(cnt)")
        if(cnt%2 != 0){
            print("play")
            audioPlayer.play()
        }else if (cnt%2 == 0){
            print("pause")
            audioPlayer.pause()
        }
       
        
    }
    
    

}//end of class
