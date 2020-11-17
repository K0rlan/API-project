//
//  OtherViewController.swift
//  ProjectForMidterm_final_final_poslednyaversia_final
//
//  Created by Koko on 10/19/20.
//

import UIKit

class OtherViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var others = [Other](){
        didSet{
            DispatchQueue.main.async {
                self.tableView2.reloadData()
            }
        }
    }
    @IBOutlet weak var tableView2: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView2.delegate = self
        self.tableView2.dataSource = self
        self.tableView2.register(UINib(nibName: "OtherTableViewCell", bundle: nil), forCellReuseIdentifier: "OtherTableViewCell")
//        self.addCh()
        self.getCartoons()
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.others.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OtherTableViewCell", for: indexPath) as! OtherTableViewCell
            let other = others[indexPath.row]
            cell.labelO.text = other.title
      
        downloadImage(urlstr: other.image, imageView: cell.imageO)
            return cell
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
        let urlString = "https://sampleapis.com/cartoons/api/cartoons2D"
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
                self.others = try JSONDecoder().decode([Other].self, from: data!)
                print(self.others)
            } catch {
                print(error)
            }
            
        
        }
        task.resume()
    }

   

}
