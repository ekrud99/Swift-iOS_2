//  ViewController.swift


import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onBtnRequest(_ sender: UIButton) {
        sendRequest()
    }
    
    func sendRequest() {
        //POST방식
        let parameter : Parameters = [
            "user_id" : "hong",
            "user_pw" : "1234"
        ]
        let url: String = "http://nissisoft21.dothome.co.kr/login_test.php"
        
        Alamofire.request(url,
                          method: .post,
                          parameters: parameter,
                          encoding: URLEncoding.httpBody,
                          headers: [ "Content-Type" : "application/x-www-form-urlencoded",
                                     "Accept" : "application/json"
                                    ]
        ).validate(statusCode: 200..<300)
        .responseJSON(completionHandler: {
            (response) in
            print( response )
            
            //JSON 결과값을 파싱해서 사용한다.
            self.parseJSON( response )
        })
        
    }
    
    func parseJSON(_ response: DataResponse<Any> ) {
        
        switch response.result {
        case .success(_) :
            //SwiftyJSON 라이브러리를 이용하여, JSON을 파싱(분리,분석)하여 사용함.
            if let json = try? JSON(data: response.data!) {
                let result = json["login_result"]["result"].string
                print( result! )
                self.textView.text.append("\n\(result!)")
                
                let message = json["login_result"]["message"].string
                print( message! )
                self.textView.text.append("\n\(message!)")
                
                let login_return = json["login_result"]["login_data"]["return"].string
                print( login_return! )
                self.textView.text.append("\n\(login_return!)")
                
                let login_message = json["login_result"]["login_data"]["message"].string
                print( login_message! )
                self.textView.text.append("\n\(login_message!)")
                
                //배열을 가져올때
                let arrayData = json["login_result"]["list"].array
                for data in arrayData! {
                    let name = data["name"].string
                    print( name! )
                    self.textView.text.append("\n\(name!)")
                    
                    let height = data["height"].string
                    print( height! )
                    self.textView.text.append("\n\(height!)")
                }
            }
            
            break
        case .failure(_) :
            print("통신을 실패함.", String(describing: response.result.error))
        break
        }
        
    }
    
}

