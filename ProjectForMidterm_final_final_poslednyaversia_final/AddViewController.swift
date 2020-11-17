//
//  AddViewController.swift
//  ProjectForMidterm_final_final_poslednyaversia_final
//
//  Created by Koko on 10/19/20.
//

import UIKit
import Alamofire
class AddViewController: UIViewController {

    @IBOutlet weak var nSubmit: UIButton!
    @IBOutlet weak var nsynopsis: UITextField!
    @IBOutlet weak var ncreators: UITextField!
    @IBOutlet weak var ngenres: UITextField!
    @IBOutlet weak var nshort: UITextField!
    @IBOutlet weak var nyears: UITextField!
    @IBOutlet weak var nimage: UITextField!
    @IBOutlet weak var ntitle: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func btn(_ sender: Any) {
       let parameters = [
            "synopsis": nsynopsis.text ?? "" ,
            "shortInfo": nshort.text ?? "",
            "posterURL": nimage.text ?? "",
            "title": ntitle.text ?? "",
            "yearsAired": nyears.text ?? "",
            "genres": ngenres.text ?? "",
            "creators": ncreators.text ?? ""

        ] as [String: Any]
          
        
        Alamofire.request("https://sampleapis.com/movies/api/action-adventure", method: .post, parameters: parameters).responseString{(response) in
            if response.result.isSuccess{
                self.alert(title: "Success", message: "Cartoon created")
            }else{
                self.alert(title: "Error", message: "Cartoon didn't crated")
            }
    }
    }
    
    func alert(title: String, message: String){
        let alerts = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alerts.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action) in
            alerts.dismiss(animated: true, completion: nil)
        }))
        self.present(alerts, animated: true, completion: nil)
    }
    
}
