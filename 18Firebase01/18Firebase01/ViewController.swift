//
//  ViewController.swift
//  18Firebase01
//
//  Created by 최다경 on 2022/03/31.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var labelLogin: UILabel!
    @IBOutlet weak var textfieldID: UITextField!
    @IBOutlet weak var textfieldPW: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    func updateUI(){
        if let user = Auth.auth().currentUser{
            //로그인 된 상태(세션지원 - 자동로그인)
            labelLogin.text = "login status: \(user.email!)"
        }else{
            //로그아웃 된 상태
            labelLogin.text = "login status: logout"
            
        }
    }
    
    @IBAction func onBtnLogin(_ sender: UIButton) {
        if let textID = textfieldID.text, let textPW = textfieldPW.text{
            if textID.count < 1 || textPW.count<1{
                print("id or pw are too short")
                return
            }
            Auth.auth().signIn(withEmail: textID, password: textPW) {
                //후행 클로저
                [weak self] user, error in
                guard let _ = self else{return}
                print("로그인 되었습니다. ")
                
                let user = Auth.auth().currentUser
                print("\(String(describing: user?.email)), \(String(describing: user?.uid))")
                
                self?.updateUI()
            }
        }else{
            print("로그인 계정 또는 암호를 확인해주세요")
        }
    }
    
    @IBAction func onBtnLogout(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
            
        }catch let signOutError as NSError{
            print("signouterror: %@", signOutError)
        }
        updateUI()
    }
    @IBAction func onBtnJoin(_ sender: UIButton) {
        if let textID = textfieldID.text, let textPW = textfieldPW.text{
            if textID.count < 1 || textPW.count < 1 {
                print("id or pw are too short")
                return
            }
            Auth.auth().createUser(withEmail: textID, password: textPW){
                //후행 클로저
                AuthResult, error in
                guard let user = AuthResult?.user, error == nil else{
                    print(error!.localizedDescription)
                    return
                }
                //회원가입 성공
                print("\(String(describing: user.email)) 회원가입 성공")
                print("\(user.uid) 회원가입 성공함")
            }
        }else{
            print("no id or pw")
        }
    }
}//end of class

