//
//  ViewController.swift
//  16PhotoGallery
//
//  Created by 최다경 on 2022/03/18.
//

import UIKit
import MobileCoreServices//포토앨범, 카메라 기능 추가

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    let imagePickerVC: UIImagePickerController! = UIImagePickerController()
    //선택된 이미지 데이터
    var captureImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onBtnGallery(_ sender: UIButton) {
        //포토앨범에 접근 가능한지
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            imagePickerVC.delegate = self
            imagePickerVC.sourceType = .photoLibrary
            imagePickerVC.mediaTypes = [kUTTypeImage as String]
            //잘라내기 편집 기능 지원
            imagePickerVC.allowsEditing = true
            //팝업
            present(imagePickerVC, animated: true, completion: nil)
        
    }else{
        print("error")
    }
}
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! String
        if(mediaType.isEqual( kUTTypeImage as NSString as String)){
            if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
                imageView.image = editedImage
                captureImage = editedImage
            }
            else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                imageView.image = originalImage
                captureImage = originalImage
            }
        }
    }

}
    


