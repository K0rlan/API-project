//
//  CartoonsViewController.swift
//  ProjectForMidterm_final_final_poslednyaversia_final
//
//  Created by Koko on 10/18/20.
//

import UIKit
import Alamofire
class CartoonsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cartoons = [Cartoons](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var i = 2
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
//        self.addCh()
        self.getCartoons()
        
//        self.delCharacters(i: 2)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cartoons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            let cartoon = cartoons[indexPath.row]
            cell.textL.text = cartoon.title
        cell.shortInfo.text = cartoon.shortInfo
        downloadImage(urlstr: cartoon.posterURL, imageView: cell.imageV)
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = self.cartoons[indexPath.item]
        if let vc = storyboard?.instantiateViewController(identifier: "InfoViewController") as? InfoViewController{
            vc.selected = [object]
            self.navigationController?.pushViewController(vc, animated: true)
        }
       
        
    }
    func downloadImage(urlstr: String, imageView: UIImageView) {
        let url = URL(string: urlstr)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    func getCartoons(){
        let urlString = "https://sampleapis.com/movies/api/action-adventure"
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
                self.cartoons = try JSONDecoder().decode([Cartoons].self, from: data!)
                print(self.cartoons)
            } catch {
                print(error)
            }
            
        
        }
        task.resume()
    }
    func addCh(){
        let parameters = [
            
//            "synopsis":"An animated series on adult-swim about the infinite adventures of Rick, a genius alcoholic and careless scientist, with his grandson Morty, a 14 year-old anxious boy who is not so smart. Together, they explore the infinite universes; causing mayhem and running into trouble. ",
//            "shortInfo": "2013 | 4 seasons | Justin Roiland, Dan Harmon",
//            "posterURL": "https://m.media-amazon.com/images/M/MV5BZjRjOTFkOTktZWUzMi00YzMyLThkMmYtMjEwNmQyNzliYTNmXkEyXkFqcGdeQXVyNzQ1ODk3MTQ@._V1_UX182_CR0,0,182,268_AL_.jpg",
//            "title": "Rick and Morty",
//            "yearsAired":"2013-present",
//            "genres": "Science Fiction, Tragicomedy, Adventure, Black Humor",
//            "creators":"Justin Roiland, Dan Harmon"
            
//        ],
//        [
//            "synopsis":"Philip J. Fry is a 25 year old delivery boy living in New York City who is cryogenically frozen on New Year's 1999 for 1000 years, where he wakes up in New New York City on December 31, 2999. There, he meets Turanga Leela, a tough but loving, beautiful one-eyed alien; and Bender, an alcohol-powered bending robot who is addicted to liquor, cigars, stealing, amongst other things. Eventually, they all meet up with Fry's Great, Great, Great, etc... Nephew, Hubert J. Farnsworth. Farnsworth is a very old man who is a genius but is very senile and forgetful. Fry, Leela, and Bender wind up working for Farnsworth's Planet Express Delivery Service. They then meet their co-workers; Amy Wong, who is a Martian intern who comes from a rich family, but is still a human who is very hip. Also, there is Hermes Conrad, who manages the delivery service and is pretty strict.  ",
//            "shortInfo": "1999 | 7 seasons | David X. Cohen, Matt Groening",
//            "posterURL": "https://m.media-amazon.com/images/M/MV5BNjk4ZWUzYmQtNTY5Yi00YzQ4LTg5YzgtNTlkMjZkZDIyYWJkXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SY1000_CR0,0,666,1000_AL_.jpg",
//            "title": "Futurama",
//            "yearsAired":"1999-2013",
//            "genres": "Sitcom, Satire, Black Humor, Science Fiction",
//            "creators":"David X. Cohen, Matt Groening"
//        ],
//        [
            "synopsis":"The beloved animated series focuses on the eponymous family in the town of Springfield in an unnamed U.S. state. The head of the Simpson family, Homer, is not a typical family man. A nuclear-plant employee, he does his best to lead his family but often finds that they are leading him. The family includes loving, blue-haired matriarch Marge, troublemaking son Bart, overachieving daughter Lisa and baby Maggie. Other Springfield residents include the family's religious neighbor, Ned Flanders, family physician Dr. Hibbert, Moe the bartender and police chief Clancy Wiggum.  ",
            "shortInfo": "1989 | 32 seasons | Matt Groening",
            "posterURL": "https://yolo.lv/storage/2020_03_01/1583085539_7246/w500.jpg",
            "title": "Simpsons",
            "yearsAired":"1999-2013",
            "genres": "Sitcom, Satire, Black Humor",
            "creators":" Matt Groening"
//        ]
        
//        ] as [[String : Any]]
        ] as [String: Any]
//        for p in parameters {
            
        
        Alamofire.request("https://sampleapis.com/movies/api/action-adventure", method: .post, parameters: parameters).responseString{(response) in
            if response.result.isSuccess{
                print(response)
            }else{
                return
            }
//        }
    
        }}
    func delCharacters(i:Int){

        let firstTodoEndpoint: String = "https://sampleapis.com/movies/api/action-adventure/5"
              Alamofire.request(firstTodoEndpoint, method: .delete)
                .responseJSON { response in
                    
                  guard response.result.error == nil else {
                    print("error calling DELETE on /todos/1")
                    if let error = response.result.error {
                      print("Error: \(error)")
                    }
                    return
                  }
                  print("DELETE ok")

              }

    }
}
