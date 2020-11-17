//
//  QuestionViewController.swift
//  ProjectForMidterm_final_final_poslednyaversia_final
//
//  Created by Koko on 10/18/20.
//

import UIKit

class QuestionViewController: UIViewController {
    var questions = [Questions]()
    
    @IBOutlet weak var v14: UILabel!
    @IBOutlet weak var v21: UILabel!
    @IBOutlet weak var v13: UILabel!
    @IBOutlet weak var v22: UILabel!
    @IBOutlet weak var v12: UILabel!
    @IBOutlet weak var v23: UILabel!
    @IBOutlet weak var v11: UILabel!
    @IBOutlet weak var v24: UILabel!
    @IBOutlet weak var v31: UILabel!
    @IBOutlet weak var v32: UILabel!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var v33: UILabel!
    @IBOutlet weak var v34: UILabel!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var v41: UILabel!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var v42: UILabel!
    @IBOutlet var v43: UIView!
    @IBOutlet weak var v44: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var q1: UILabel!
    @IBOutlet weak var q4: UILabel!
    
    @IBOutlet weak var q3: UILabel!
    @IBOutlet weak var q2: UILabel!
    @IBOutlet weak var submit: UIButton!
 
    @IBAction func qButton(_ sender: UIButton) {
        if sender.tag == 1{
                   b1.isSelected = true
                   b2.isSelected = false
                   b3.isSelected = false
                   b4.isSelected = false
                   print("btn1")
               }else if sender.tag == 2{
                   b1.isSelected = false
                   b2.isSelected = true
                   b3.isSelected = false
                   b4.isSelected = false
                   print("btn2")
               }else if sender.tag == 3{
                   b1.isSelected = false
                   b2.isSelected = false
                   b3.isSelected = true
                   b4.isSelected = false
                   print("btn3")
               }else if sender.tag == 4{
                   b1.isSelected = false
                   b2.isSelected = false
                   b3.isSelected = false
                   b4.isSelected = true
                   print("btn4")
               }
    }
    
    @IBOutlet weak var b21: UIButton!
    
    @IBOutlet weak var b24: UIButton!
    @IBOutlet weak var b23: UIButton!
    @IBOutlet weak var b22: UIButton!
    @IBAction func qButton2(_ sender: UIButton) {
        if sender.tag == 1{
                   b21.isSelected = true
                   b22.isSelected = false
                   b23.isSelected = false
                   b24.isSelected = false
                   print("btn1")
               }else if sender.tag == 2{
                   b21.isSelected = false
                   b22.isSelected = true
                   b23.isSelected = false
                   b24.isSelected = false
                   print("btn2")
               }else if sender.tag == 3{
                   b21.isSelected = false
                   b22.isSelected = false
                   b23.isSelected = true
                   b24.isSelected = false
                   print("btn3")
               }else if sender.tag == 4{
                   b21.isSelected = false
                   b22.isSelected = false
                   b23.isSelected = false
                   b24.isSelected = true
                   print("btn4")
               }
    }
    
    @IBOutlet weak var b34: UIButton!
    @IBOutlet weak var b33: UIButton!
    @IBOutlet weak var b32: UIButton!
    @IBOutlet weak var b31: UIButton!
    @IBAction func qbButton3(_ sender: UIButton) {
        if sender.tag == 1{
                   b31.isSelected = true
                   b32.isSelected = false
                   b33.isSelected = false
                   b34.isSelected = false
                   print("btn1")
               }else if sender.tag == 2{
                   b31.isSelected = false
                   b32.isSelected = true
                   b33.isSelected = false
                   b34.isSelected = false
                   print("btn2")
               }else if sender.tag == 3{
                   b31.isSelected = false
                   b32.isSelected = false
                   b33.isSelected = true
                   b34.isSelected = false
                   print("btn3")
               }else if sender.tag == 4{
                   b31.isSelected = false
                   b32.isSelected = false
                   b33.isSelected = false
                   b34.isSelected = true
                   print("btn4")
               }
    }
    
    @IBOutlet weak var b44: UIButton!
    @IBOutlet weak var b43: UIButton!
    @IBOutlet weak var b42: UIButton!
    @IBOutlet weak var b41: UIButton!
    @IBAction func qButton4(_ sender: UIButton) {
        if sender.tag == 1{
                   b41.isSelected = true
                   b42.isSelected = false
                   b43.isSelected = false
                   b44.isSelected = false
                   print("btn1")
               }else if sender.tag == 2{
                   b41.isSelected = false
                   b42.isSelected = true
                   b43.isSelected = false
                   b44.isSelected = false
                   print("btn2")
               }else if sender.tag == 3{
                   b41.isSelected = false
                   b42.isSelected = false
                   b43.isSelected = true
                   b44.isSelected = false
                   print("btn3")
               }else if sender.tag == 4{
                   b41.isSelected = false
                   b42.isSelected = false
                   b43.isSelected = false
                   b44.isSelected = true
                   print("btn4")
               }
    }
    func getCartoons(){
        let urlString = "https://sampleapis.com/avatar/api/questions"
        guard  let url = URL(string: urlString) else {
            print("URL isn't valid")
            return
        }
        let session = URLSession.shared
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request){
            (data, response, error) in
            guard error == nil else {
                print("error: \(error!)")
                return
            }
            guard data != nil else{
                print("didn't receive data")
                return
            }

            do {
                self.questions = try JSONDecoder().decode([Questions].self, from: data!)
                print(self.questions)
//                for e in self.questions {
////                    self.questionL.text = e.question
//
//                    print(e.possibleAnswers.forEach{(a) in
//                        print("asdasd"+a)
//                    })
//                }
//                for (index, question) in self.questions.enumerated() {
//                    if index == 1{
//                        self.questionL.text = question.question
//                        print(question.question)
//
//                    }
//                }
                
            } catch {
                print(error)
            }
            
        
        }
        task.resume()
    }
    

   
}
