//
//  EpisodesViewController.swift
//  ProjectForMidterm_final_final_poslednyaversia_final
//
//  Created by Koko on 10/18/20.
//

import UIKit

class EpisodesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
        
    
    var episodes = [Episodes](){
        didSet{
            DispatchQueue.main.async {
                self.tableVIew.reloadData()
            }
        }
    }
    @IBOutlet weak var tableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableVIew.delegate = self
        self.tableVIew.dataSource = self
        self.tableVIew.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondTableViewCell")
       
        self.getEpisodes()
       
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell
        let episode = episodes[indexPath.row]
//        cell.labelf.text = episode.name
//        let season = "\(episode.season)"
//        let epis = "\(episode.episode)"
//        cell.labelS.text = season
//        cell.labelT.text = epis
        cell.nameL.text = episode.name
        cell.labelFo.text = episode.air_date
        return cell
    }
   
    func getEpisodes(){
        let urlString = "https://sampleapis.com/rickandmorty/api/episodes"
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
                self.episodes = try JSONDecoder().decode([Episodes].self, from: data!)
//                print(self.episodes)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    



}
