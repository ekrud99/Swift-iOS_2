//
//  ViewController.swift
//  16PhotoGallery
//
//  Created by 최다경 on 2022/03/18.
//

import UIKit
import MobileCoreServices//포토앨범, 카메라 기능 추가

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    let imagePickerVC: UIImagePickerController! = UIImagePickerController() //선택된 이미지 데이터
    var captureImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = appDelegate.img
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
        appDelegate.picname = nameTextField.text
}
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! String
        if(mediaType.isEqual( kUTTypeImage as NSString as String)){
            if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
                imageView.image = editedImage
                appDelegate.img = editedImage
                captureImage = editedImage
                print("editedImage: ", editedImage)
            }
            else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                imageView.image = originalImage
                appDelegate.img = originalImage
                captureImage = originalImage
            }
            //피커뷰 창을 닫아줌
            self.dismiss(animated: true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

}
    


