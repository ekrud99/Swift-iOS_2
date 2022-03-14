//
//  ViewController.swift
//  14AudioPlayer
//
//  Created by 최다경 on 2022/03/12.
//

//import UIKit
//import AVFoundation //애플 네이티브 SDK에서 제공
//
//class ViewController: UIViewController, AVAudioPlayerDelegate {
//
//    @IBOutlet weak var progressView: UIProgressView!
//    @IBOutlet weak var sliderSeek: UISlider!
//    @IBOutlet weak var labelCurrentTime: UILabel!
//    @IBOutlet weak var labelEndTime: UILabel!
//
//    @IBOutlet weak var btnPlay: UIButton!
//    @IBOutlet weak var btnPause: UIButton!
//    @IBOutlet weak var btnStop: UIButton!
//    @IBOutlet weak var sliderVolume: UISlider!
//
//    var audioPlayer: AVAudioPlayer!
//    var audioFile: URL!//nil이 아님을 확신하고 !
//    var time: Timer?//nil일 가능성이 있음
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        selectAudioFile()
//        initPlayer()
//
//    }
//    func selectAudioFile(){
//        audioFile = Bundle.main.url(forResource: "music", withExtension: "mp3")
//    }
//    func initPlayer(){
//        do{
//            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
//        }catch let error as NSError{
//            print("error init player", error)
//        }
//        audioPlayer.delegate = self
//        audioPlayer.prepareToPlay()//메모리에 음원을 넣어줌. 버퍼링
//        audioPlayer.volume = 10.0
//
//        labelCurrentTime.text = "00:00"
//        let min = Int(audioPlayer.duration / 60)
//        let sec = Int(audioPlayer.duration) % 60
//        labelEndTime.text = "\(min):\(sec)"//총 재생 시간
//    }
//
//}//end of class
//

//  ViewController.swift

import UIKit
import AVFoundation; //애플 네이티브 SDK에서 제공

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var sliderSeek: UISlider!
    @IBOutlet weak var labelCurrentTime: UILabel!
    @IBOutlet weak var labelEndTime: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var sliderVolume: UISlider!
    
    var audioPlayer : AVAudioPlayer!
    var audioFile : URL!
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //번들안의 mp3, ogg, wav파일 재생시
        //selectAudioFile()
        //initPlayer()
        
        //HTTP서버 상의 오디오 파일 재생시
        let urlstring = "http://nissisoft21.dothome.co.kr/music.mp3"
        let url = URL(string: urlstring)
        downloadFileFromURL(url: url!)
    }
    func downloadFileFromURL(url: URL){
        var downloadTask: URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: {
            [weak self](URL, responds, error) -> Void in
            //다운로드를 마쳤을 때
            self?.audioFile = URL! as URL
            self?.initPlayer()
        })
        downloadTask.resume()
    }
    
    func selectAudioFile() {
        audioFile = Bundle.main.url(forResource: "music1", withExtension: "mp3")
    }

    func initPlayer() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            print( "error init player", error )
            
        }
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay() //메모리에 음원을 넣어줌. 버퍼링
        audioPlayer.volume = 1.0
        
        DispatchQueue.main.sync {
            labelCurrentTime.text = "00:00"
            labelCurrentTime.text = "00:00"  //현재재생시간
            let min = Int(audioPlayer.duration / 60)
            let sec = Int(audioPlayer.duration) % 60
            labelEndTime.text = "\(min):\(sec)"  //총재생시간
            
            //UI init
            sliderVolume.maximumValue = 1.0
            sliderVolume.value = 1
            progressView.progress = 0
            btnPlay.isEnabled = true//활성화
            btnPause.isEnabled = false//비활성화
            btnStop.isEnabled = false//비활성화
            
            sliderSeek.maximumValue = Float(audioPlayer.duration)
            sliderSeek.value = 0
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(callbackTimer), userInfo: nil, repeats: true)
            }
        }//다운로드시 버튼, 프로그래스바 등의 일치
        
        
    
    //타이머 콜백 함수
    @objc func callbackTimer(){
        let min = Int(audioPlayer.currentTime / 60)
        let sec = Int(audioPlayer.currentTime) % 60
        labelCurrentTime.text = "\(min):\(sec)"
        
        progressView.progress = Float(audioPlayer.currentTime / audioPlayer.duration)
    }
    @IBAction func onBtnPlay(_ sender: UIButton) {
        audioPlayer.play()
        
        btnPlay.isEnabled = false
        btnPause.isEnabled = true
        btnStop.isEnabled = true
    }
    
    @IBAction func onBtnPause(_ sender: UIButton) {
        audioPlayer.pause()
        
        btnPlay.isEnabled = true//활성화
        btnPause.isEnabled = false
        btnStop.isEnabled = false
    }
    
    @IBAction func onBtnStop(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer = nil
        //initPlayer() - 파일로 재생 시
        
        let urlstring = "http://nissisoft21.dothome.co.kr/music.mp3"
        let url = URL(string: urlstring)
        downloadFileFromURL(url: url!)
        //-> 다운로드로 재생 시
        
        btnPlay.isEnabled = true
        btnPause.isEnabled = false
        btnStop.isEnabled = false
    }
    
    @IBAction func onSliderVolume(_ sender: UISlider) {
        audioPlayer.volume = sliderVolume.value
    }
    
    @IBAction func onSliderSeekUp(_ sender: UISlider) {
        audioPlayer.pause()
        audioPlayer.currentTime = Double(sender.value)//slider의 value 전달
        audioPlayer.play()
        
        progressView.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
}
    
   
