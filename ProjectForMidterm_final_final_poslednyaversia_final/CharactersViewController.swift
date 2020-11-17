//
//  CharactersViewController.swift
//  ProjectForMidterm_final_final_poslednyaversia_final
//
//  Created by Koko on 10/18/20.
//

import UIKit
import Alamofire
class CharactersViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
 
    var characters = [Characters2](){
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        self.getCharacters()
       
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let character = characters[indexPath.row]
        cell.cellLabel.text = character.name
        downloadImage(urlstr: character.image, imageView: cell.cellImage)
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 240)
    }
    func getCharacters(){
        let urlString = "https://sampleapis.com/rickandmorty/api/characters"
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
                self.characters = try JSONDecoder().decode([Characters2].self, from: data!)
                print(self.characters)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    

}

   


