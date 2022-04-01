//
//  ListViewController.swift
//  18Firebase01
//
//  Created by 최다경 on 2022/04/01.
//

import UIKit
import Firebase
import FirebaseFirestore

class ListViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    //swift는 구조체 친화적
    struct IdolData{
        var name: String = ""
        var imageString: String = ""
        //Firebase DB에 들어가는 데이타 구조
        //클래스, 구조체가 들어갈 수 없음
        //1. Number
        //2. String
        //3. Array
        //4. Dictionary
        func getDic() ->[String:String]{
            let dict = ["name": self.name,
                        "imageString": self.imageString]
            return dict
        }
        
    }
    //구조체 배열
    var idolArray: Array<IdolData> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func onBtnAdd(_ sender: UIButton) {
    }
    
    @IBAction func onBtnRead(_ sender: Any) {
        readListData()
    }
    
    func readListData(){
        let db = Firestore.firestore()
        
        db.collection("idols").whereField("name", isEqualTo: "수지").getDocuments(){
            //후행 클로저
            (QuerySnapshot, err) in
            if let error = err{
                print("읽기 에러 발생", error.localizedDescription)
                self.textView.text.append("\n읽기오류 발생")
            }else{
                for document in QuerySnapshot!.documents{
                    print("\(document.documentID) -> \(document.data())")
                    
                    let dataDic = document.data() as NSDictionary
                    let name = dataDic["name"] as? String ?? "이름 없음"
                    let imageString = dataDic["imageString"] as? String ?? "이미지 없음"
                    
                    //구조체로 데이타를 넣어줌
                    var idol = IdolData()
                    idol.name = name
                    idol.imageString = imageString
                    self.idolArray.append(idol)
                }
                for idol in self.idolArray{
                    self.textView.text.append("\n\(idol.name)")
                    self.textView.text.append("\n\(idol.imageString)")
                }
            }
        }
    }
    

}
