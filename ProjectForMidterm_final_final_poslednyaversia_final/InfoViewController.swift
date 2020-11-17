//
//  InfoViewController.swift
//  ProjectForMidterm_final_final_poslednyaversia_final
//
//  Created by Koko on 10/18/20.
//

import UIKit
import Alamofire
class InfoViewController: UIViewController {
    var selected = [Cartoons]()
    var check = [Cartoons]()
   
    @IBOutlet weak var imageIV: UIImageView!
    @IBOutlet weak var shortII: UILabel!
    @IBOutlet weak var titleI: UILabel!
    @IBOutlet weak var genresI: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var creatorsI: UILabel!
    
    @IBOutlet weak var yearsI: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        check = selected
        
        print(selected[0].id)
        titleI.text = selected[0].title
        shortII.text = selected[0].shortInfo
        genresI.text = selected[0].genres
        info.text = selected[0].synopsis
        info.sizeToFit()
        creatorsI.text = selected[0].creators
        yearsI.text = selected[0].yearsAired
        downloadImage(urlstr: selected[0].posterURL, imageView: imageIV)
        self.getCharacters()
        self.getEpisodes()
        self.getQuestions()
        
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

                for n in 2...9{
                    self.delCharacters(i: n)
                }
//                if self.check[0].id == 1{
                    self.updateChRM()
                    self.addChRM()

//                }else{
//                    self.updateChRM()
//                    self.addChRM()

//                }
                
                
            } catch {
                print(error)
            }


        }
        task.resume()
    }
   
    func delCharacters(i: Int){

        let firstTodoEndpoint: String = "https://sampleapis.com/rickandmorty/api/characters/\(i)"
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
    func addChRM(){
           let parameters1 = [[
            "gender": "Male",
            "image": "https://vignette.wikia.nocookie.net/avatar/images/c/cc/Sokka.png/revision/latest?cb=20140905085428",
            "name": "Sokka",
            "origin": "Southern Water Tribe",
            "species": "Politician,Tactician,Warrior",
            "status": "15",
            "type": "boomerang",
            ],[

            "gender": "Female",
            "image": "https://vignette.wikia.nocookie.net/avatar/images/7/7a/Katara_smiles_at_coronation.png/revision/latest?cb=20150104171449",
            "name": "Katara",
            "origin": "Southern Water Tribe",
            "species": "Healer,Healing instructor,Waterbending instructor",
            "status": "14",
            "type": "Water, Blood magic",
             ],[

            "gender": "Male",
            "image": "https://vignette.wikia.nocookie.net/avatar/images/4/4b/Zuko.png/revision/latest?cb=20180630112142",
            "name": "Zuko",
            "origin": "Fire Nation Capital",
            "species": "Ambassador,Fire Lord (formerly),Firebending instructor,Tea shop assistant (formerly)",
            "status": "16",
            "type": "Fire",
                ],[
            "gender": "Female",
            "image": "https://vignette.wikia.nocookie.net/avatar/images/1/12/Azula.png/revision/latest?cb=20140905084941",
            "name": "Azula",
            "origin": "Fire Nation Capital",
            "species": "Kuei (as earth monarch),Long Feng (as Head of the Dai Li)",
            "status": "14",
                    "type": "Fire, lightning",],[

            "gender": "Male",
            "image": "https://vignette.wikia.nocookie.net/avatar/images/4/4a/Ozai.png/revision/latest?cb=20130612170743",
            "name": "Ozai",
            "origin": "Fire Nation Capital",
            "species": "Azulon (as Fire Lord)",
            "status": "unknown",
            "type": "Fire, lightning",],[



            "gender": "Female",
            "image": "https://vignette.wikia.nocookie.net/avatar/images/4/40/Mai.png/revision/latest?cb=20090406114652",
            "name": "Mai",
            "origin": "Fire Nation Capital",
            "species": "Flower shop assistant",
            "status": "unknown",
            "type": "Knives and stilettos",],[


            "gender": "Male",
            "image": "https://vignette.wikia.nocookie.net/avatar/images/6/65/Appa_flying.png/revision/latest?cb=20140517110636",
            "name": "Appa",
            "origin": " Eastern Air Temple",
            "species": "Aang's sky bison",
            "status": "unknown",
                "type": "Air, body bulk, tail",],[
                    
                    "gender": "Female",
                    "image": "https://vignette.wikia.nocookie.net/avatar/images/4/46/Toph_Beifong.png/revision/latest?cb=20131230122047",
                    "name": "Toph Beifong",
                    "origin": "Gaoling, Earth Kingdom",
                    "species": "Earthbending, Metalbending",
                    "status": "unknown",
                    "type": "Earth, metal",
            ]]
        as [[String : Any]]
        let parameters2 = [[
           "gender": "Male",
            "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            "name": "Morty Smith",
            "origin": "Earth (C-137)",
            "species": "Human",
            "status": "Alive",
            "type": "Human",
        ],[
            "name": "Summer Smith",
            "status": "Alive",
            "species": "Human",
            "type": "Human",
            "gender": "Female",
            "origin": "Earth (Replacement Dimension)",
            "image": "https://rickandmortyapi.com/api/character/avatar/3.jpeg"
        ],
        [
            "name": "Beth Smith",
            "status": "Alive",
            "species": "Human",
            "type": "Human",
            "gender": "Female",
            "origin": "Earth (Replacement Dimension)",
            "image": "https://rickandmortyapi.com/api/character/avatar/4.jpeg"
        ],
        [
            "name": "Jerry Smith",
            "status": "Alive",
            "species": "Human",
            "type": "Human",
            "gender": "Male",
            "origin": "Earth (Replacement Dimension)",
            "image": "https://rickandmortyapi.com/api/character/avatar/5.jpeg"
        ],
        [
            "name": "Abadango Cluster Princess",
            "status": "Alive",
            "species": "Alien",
            "type": "Alien",
            "gender": "Female",
            "origin": "Abadango",
            "image": "https://rickandmortyapi.com/api/character/avatar/6.jpeg"
        ],
        [
            "name": "Abradolf Lincler",
            "status": "unknown",
            "species": "Human",
            "type": "Genetic experiment",
            "gender": "Male",
            "origin": "Earth (Replacement Dimension)",
            "image": "https://rickandmortyapi.com/api/character/avatar/7.jpeg"
        ],
        [
            "name": "Adjudicator Rick",
            "status": "Dead",
            "species": "Human",
            "type": "Human",
            "gender": "Male",
            "origin": "unknown",
            "image": "https://rickandmortyapi.com/api/character/avatar/8.jpeg"
        ],[
            "name": "Agency Director",
            "status": "Dead",
            "species": "Human",
            "type": "Human",
            "gender": "Male",
            "origin": "Earth (Replacement Dimension)",
            "image": "https://rickandmortyapi.com/api/character/avatar/9.jpeg"
        ]
        ]
     as [[String : Any]]
        let parameters3 = [[
         "gender": "Robot-Man",
         "image": "https://vignette.wikia.nocookie.net/futurama/images/5/51/Bender.jpg/revision/latest?cb=20141220211903&path-prefix=ru",
         "name": "Bender",
         "origin": "Earth",
         "species": "Robot",
         "status": "4-10",
         "type": "Revived",

         ],
        [
         "gender": "Female",
         "image": "https://vignette.wikia.nocookie.net/futurama/images/1/10/Leela.jpg/revision/latest?cb=20141220211651&path-prefix=ru",
         "name": "Turanga Leela",
         "origin": "Earth",
         "species": "Mutant",
         "status": "25-31",
         "type": "Alive",

         ],
        [
         "gender": "Male",
         "image": "https://vignette.wikia.nocookie.net/futurama/images/a/a4/Professor.jpg/revision/latest?cb=20130722200510&path-prefix=ru",
         "name": "Professor Farnsworth",
         "origin": "Earth",
         "species": "Human",
         "status": "159-165",
         "type": "Alive",

         ],
        [
         "gender": "Male",
         "image": "https://vignette.wikia.nocookie.net/futurama/images/0/0a/Zoidberg_rev.jpg/revision/latest?cb=20130722200511&path-prefix=ru",
         "name": "Dr. John A. Zoidberg",
         "origin": "Decapod 10",
         "species": "Decapodian",
         "status": "86-92",
         "type": "Alive",

         ],
        [
         "gender": "Female",
         "image": "https://vignette.wikia.nocookie.net/futurama/images/2/28/Amy_rev.jpg/revision/latest?cb=20130722200517&path-prefix=ru",
         "name": "Amy Wong",
         "origin": "Earth",
         "species": "Human",
         "status": "28",
         "type": "Alive",

         ],
        [
         "gender": "Male",
         "image": "https://vignette.wikia.nocookie.net/futurama/images/3/3f/Hermes.jpg/revision/latest?cb=20130722200519&path-prefix=ru",
         "name": "Hermes Conrad",
         "origin": "Earth",
         "species": "Human",
         "status": "41-47",
         "type": "Alive",

         ],
        [
         "gender": "Male",
         "image": "https://vignette.wikia.nocookie.net/futurama/images/c/c9/Scruffy.jpg/revision/latest?cb=20130722200522&path-prefix=ru",
         "name": "Scruffy Scruffington",
         "origin": "Earth",
         "species": "Human",
         "status": "60",
         "type": "Alive",

         ],
        [
         "gender": "Male",
         "image": "https://static.wikia.nocookie.net/enfuturama/images/4/40/Gary.png/revision/latest/scale-to-width-down/700?cb=20090812200512",
         "name": "Gary",
         "origin": "Earth",
         "species": "Human",
         "status": "30",
         "type": "Alive",

         ],
        ]
        as [[String : Any]]
        let parameters4 = [[
            "gender": "Male",
            "image": "https://static.wikia.nocookie.net/simpsons/images/b/bd/Homer_Simpson.png/revision/latest/scale-to-width-down/600?cb=20140126234206",
            "name": "Homer Simpson",
            "origin": "Springfield",
            "species": "Dad",
            "status": "alive",
            "type": "Human",
        ],[



            "gender": "Female",
            "image": "https://static.wikia.nocookie.net/simpsons/images/4/4d/MargeSimpson.png/revision/latest/scale-to-width-down/600?cb=20180314071936",
            "name": "Marge Simpson",
            "origin": "Springfield",
            "species": "Mom",
            "status": "alive",
            "type": "Human",
        ],[
            "gender": "Male",
            "image": "https://static.wikia.nocookie.net/simpsons/images/6/65/Bart_Simpson.png/revision/latest?cb=20190409004756",
            "name": "Bart Simpson",
            "origin": "Springfield",
            "species": "Bartman",
            "status": "alive",
            "type": "child",
        ],[

            "gender": "Female",
            "image": "https://static.wikia.nocookie.net/simpsons/images/9/9d/Maggie_Simpson.png/revision/latest/scale-to-width-down/440?cb=20200214194327",
            "name": "Maggie Simpson",
            "origin": "Springfield",
            "species": "The Baby",
            "status": "alive",
            "type": "child",

        ],[

            "gender": "Female",
            "image": "https://static.wikia.nocookie.net/simpsons/images/d/d5/Lisa_Simpson_official.png/revision/latest/scale-to-width-down/494?cb=20190409004811",
            "name": "Lisa Marie Simpson",
            "origin": "Springfield",
            "species": "Truth Teller",
            "status": "alive",
            "type": "child",

        ],[
            "gender": "Male",
            "image": "https://static.wikia.nocookie.net/simpsons/images/2/2c/Santa%27s_Little_Helper.png/revision/latest/scale-to-width-down/524?cb=20180311074656",
            "name": "Santa's Little Helper",
            "origin": "Springfield",
            "species": "Greyhound",
            "status": "alive",
            "type": "dog",
        ],[

            "gender": "Male",
            "image": "https://static.wikia.nocookie.net/simpsons/images/8/84/Ned_Flanders.png/revision/latest/scale-to-width-down/548?cb=20100513160156",
            "name": "Nedward Flanders, Jr.",
            "origin": "Springfield",
            "species": "Stupid Flanders",
            "status": "alive",
            "type": "Human",
        ],[


            "gender": "Male",
            "image": "https://static.wikia.nocookie.net/simpsons/images/a/a9/Abraham_Simpson.png/revision/latest/scale-to-width-down/604?cb=20151011181838",
            "name": "Abraham Simpson II",
            "origin": "Much Apu About Nothing.",
            "species": "Abe, Grampa",
            "status": "alive",
            "type": "Human",

         ]
        ]
        as [[String : Any]]

        
        if self.selected[0].id == 1{
            for p in parameters1 {
            Alamofire.request("https://sampleapis.com/rickandmorty/api/characters/", method: .post, parameters: p).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }}
        }else if self.selected[0].id == 2{
            for p in parameters2 {
            Alamofire.request("https://sampleapis.com/rickandmorty/api/characters/", method: .post, parameters: p).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }
        }else if self.selected[0].id == 3{
            for p in parameters3 {
            Alamofire.request("https://sampleapis.com/rickandmorty/api/characters/", method: .post, parameters: p).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }
        }else if self.selected[0].id == 4{
            for p in parameters4 {
            Alamofire.request("https://sampleapis.com/rickandmorty/api/characters/", method: .post, parameters: p).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }
        }
        
    }
    func updateChRM(){
           let parameters1 = [
            "gender": "Male",
            "image": "https://vignette.wikia.nocookie.net/avatar/images/a/ae/Aang_at_Jasmine_Dragon.png/revision/latest?cb=20130612174003",
            "name": "Aang",
            "origin": "Southern Air Temple",
            "species": "Avatar",
            "status": "12/112",
            "type": "Water, Air, Earth, Fire"
                
            ] as [String : Any]
           let parameters2 = [
            "gender": "Male",
            "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            "name": "Rick Sanchez",
            "origin": "Earth (C-137)",
            "species": "Human",
            "status": "Alive",
            "type": "Human"
//            "id": 1
            ]
           as [String : Any]

        let parameters3 = [
         "gender": "Male",
         "image": "https://static.wikia.nocookie.net/enfuturama/images/c/c0/Philip-J-Fry.png/revision/latest/scale-to-width-down/692?cb=20200506091628",
         "name": "Philip J. Fry",
         "origin": "Earth",
         "species": "Human",
         "status": "Alive",
         "type": "Human"
//            "id": 1
         ]
        as [String : Any]

        let parameters4 = [
         "gender": "Male",
         "image": "https://static.wikia.nocookie.net/simpsons/images/b/bd/Homer_Simpson.png/revision/latest/scale-to-width-down/600?cb=20140126234206",
         "name": "Homer Simpson",
         "origin": " Springfield's State",
         "species": "Dad",
         "status": "Alive",
         "type": "Human"
//            "id": 1
         ]
        as [String : Any]
        if self.selected[0].id == 1{
            
            Alamofire.request("https://sampleapis.com/rickandmorty/api/characters/1", method: .put, parameters: parameters1).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }else if self.selected[0].id == 2{
            Alamofire.request("https://sampleapis.com/rickandmorty/api/characters/1", method: .put, parameters: parameters2).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }else if self.selected[0].id == 3{
            Alamofire.request("https://sampleapis.com/rickandmorty/api/characters/1", method: .put, parameters: parameters3).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }else if self.selected[0].id == 4{
            Alamofire.request("https://sampleapis.com/rickandmorty/api/characters/1", method: .put, parameters: parameters4).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }
           
    }
//------------------------------------------------------------------------------------------
    func getEpisodes(){
        let urlString = "https://sampleapis.com/rickandmorty/api/episodes/"
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

                for n in 2...100  {
                    self.delEpisodes(i: n)
                }
//                if self.check[0].id == 1{
                    self.updateEpisodes()
                    self.addEpisodes()

//                }else{
//                    self.updateChRM()
//                    self.addChRM()

//                }
                
                
            } catch {
                print(error)
            }


        }
        task.resume()
    }
   

func delEpisodes(i: Int){

    let firstTodoEndpoint: String = "https://sampleapis.com/rickandmorty/api/episodes/\(i)"
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
    func addEpisodes(){
           let parameters1 = [[
            
                    "season": 1,
                    "episode": 2,
                    "name": "'The Avatar Returns'",
                    "air_date": "February 21, 2005",
                    ],
                [
                    "season": 1,
                    "episode": 3,
                    "name": "'The Southern Air Temple'",
                    "air_date": "February 25, 2005",
                    ],
                [
                    "season": 1,
                    "episode": 4,
                    "name": "'The Warriors of Kyoshi'",
                    "air_date": "March 4, 2005",
                ],
                [
                    "season": 1,
                    "episode": 5,
                    "name": "'The King of Omashu'",
                    "air_date": "March 18, 2005",
                ],
                [
                    "season": 1,
                    "episode": 6,
                    "name": "'Imprisoned'",
                    "air_date": "March 25, 2005",
                    ],
                [
                    "season": 1,
                    "episode": 7,
                    "name": "'Winter Solstice Part 1: The Spirit World'",
                    "air_date": "April 8, 2005",
                    ],
                [
                    "season": 1,
                    "episode": 8,
                    "name": "'Winter Solstice Part 2: Avatar Roku'",
                    "air_date": "April 15, 2005",
                    ],
            [
                    "season": 1,
                    "episode": 9,
                    "name": "'The Waterbending Scroll'",
                    "air_date": "April 29, 2005",
                    ],
                [
                    "season": 1,
                    "episode": 10,
                    "name": "'Jet'",
                    "air_date": "May 6, 2005",
                    
                
            ]]
        as [[String : Any]]
        let parameters2 = [[
            "name": "Lawnmower Dog",
                    "air_date": "December 9, 2013",
                    "episode": 2,
                    "season": 1
        ],[
                    "name": "Anatomy Park",
                    "air_date": "December 16, 2013",
                    "episode": 3,
                    "season": 1
        ],[
                    "name": "M. Night Shaym-Aliens!",
                    "air_date": "January 13, 2014",
                    "episode": 4,
                    "season": 1],[
               
                    "name": "Meeseeks and Destroy",
                    "air_date": "January 20, 2014",
                    "episode": 5,
                    "season": 1],[
                    "name": "Rick Potion #9",
                    "air_date": "January 27, 2014",
                    "episode": 6,
                    "season": 1],[
                    "name": "Raising Gazorpazorp",
                    "air_date": "March 10, 2014",
                    "episode": 7,
                    "season": 1],[
                    "name": "Rixty Minutes",
                    "air_date": "March 17, 2014",
                    "episode": 8,
                    "season": 1],[
                    "name": "Something Ricked This Way Comes",
                    "air_date": "March 24, 2014",
                    "episode": 9,
                    "season": 1],[
                    "name": "Close Rick-counters of the Rick Kind",
                    "air_date": "April 7, 2014",
                    "episode": 10,
                    "season": 1
        ]
        ]
     as [[String : Any]]
        let parameters3 = [[
                    "season": 1,
                    "episode":2,
                    "name": "The Series Has Landed",
                    "air_date": "April 4, 1999",
                    ],[
                    "season": 1,
                    "episode":3,
                    "name": "I, Roommate",
                    "air_date": "April 6, 1999",
                    ],[
                    "season": 1,
                    "episode":4,
                    "name": "Love's Labours Lost in Space",
                    "air_date": "April 13, 1999",
                   ],[
                    "season": 1,
                    "episode":5,
                    "name": "Fear of a Bot Planet",
                    "air_date": "April 20, 1999",
                
                   ],[
                
                    "season": 1,
                    "episode":6,
                    "name": "A Fishful of Dollars",
                    "air_date": "April 27, 1999",
                    
                   ],[
                    "season": 1,
                    "episode":7,
                    "name": "My Three Suns",
                    "air_date": "May 4, 1999",
                   ],[
                    "season": 1,
                    "episode":8,
                    "name": "A Big Piece of Garbage",
                    "air_date": "May 11, 1999",
                   ],[
                    "season": 1,
                    "episode":9,
                    "name": "Hell Is Other Robots",
                    "air_date": "May 18, 1999",
                   ],[
                    "season": 1,
                    "episode":10,
                    "name": "A Flight to Remember",
                    "air_date": "September 26, 1999",
                   
         ]
        ]
        as [[String : Any]]
        let parameters4 = [[
                    "season": 1,
                    "episode": 2,
                    "name": "Bart the Genius",
                    "air_date": "1990-01-14T00:00:00.000Z",
                    ],[
                    "season": 1,
                    "episode": 3,
                    "name": "Homer's Odyssey",
                    "air_date": "1990-01-21T00:00:00.000Z",
                    ],[
                    "season": 1,
                    "episode": 4,
                    "name": "There's No Disgrace Like Home",
                    "air_date": "1990-01-28T00:00:00.000Z",
                    ],[
                    "season": 1,
                    "episode": 5,
                    "name": "Bart the General",
                    "air_date": "1990-02-04T00:00:00.000Z",
                    ],[
                    "season": 1,
                    "episode": 6,
                    "name": "Moaning Lisa",
                    "air_date": "1990-02-11T00:00:00.000Z",
                    ],[
                    "season": 1,
                    "episode": 7,
                    "name": "The Call of the Simpsons",
                    "air_date": "1990-09-01T23:00:00.000Z",
                    ],[
                    "season": 1,
                    "episode": 8,
                    "name": "The Telltale Head",
                    "air_date": "1990-02-25T00:00:00.000Z",
                    ],[
                    "season": 1,
                    "episode": 9,
                    "name": "Life on the Fast Lane",
                    "air_date": "1990-03-18T00:00:00.000Z",
                    ],[
                    "season": 1,
                    "episode": 10,
                    "name": "Homer's Night Out",
                    "air_date": "1990-03-25T00:00:00.000Z",
         ]
        ]
        as [[String : Any]]

        
        if self.selected[0].id == 1{
            for p in parameters1 {
            Alamofire.request("https://sampleapis.com/rickandmorty/api/episodes/", method: .post, parameters: p).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }}
        }else if self.selected[0].id == 2{
            for p in parameters2 {
            Alamofire.request("https://sampleapis.com/rickandmorty/api/episodes/", method: .post, parameters: p).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }
        }else if self.selected[0].id == 3{
            for p in parameters3 {
            Alamofire.request("https://sampleapis.com/rickandmorty/api/episodes/", method: .post, parameters: p).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }
        }else if self.selected[0].id == 4{
            for p in parameters3 {
            Alamofire.request("https://sampleapis.com/rickandmorty/api/episodes/", method: .post, parameters: p).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }
        }
        
    }
    func updateEpisodes(){
           let parameters1 = [
            "season": 1,
            "episode": 1,
            "name": "'The Boy in the Iceberg'",
            "air_date": "February 21, 2005",
                
            ] as [String : Any]
           let parameters2 = [
            
            "name": "Pilot",
            "air_date": "December 2, 2013",
            "episode": 1,
            "season": 1
]
           as [String : Any]

        let parameters3 = [
            "season": 1,
            "episode":1,
            "name": "Space Pilot 3000",
            "air_date": "March 28, 1999",
           ]
        as [String : Any]

        let parameters4 = [
            "season": 1,
            "episode": 1,
            "name": "Simpsons Roasting on an Open Fire",
            "air_date": "1990-09-01T23:00:00.000Z",
            ]
        as [String : Any]
        if self.selected[0].id == 1{
            
            Alamofire.request("https://sampleapis.com/rickandmorty/api/episodes/1", method: .put, parameters: parameters1).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }else if self.selected[0].id == 2{
            Alamofire.request("https://sampleapis.com/rickandmorty/api/episodes/1", method: .put, parameters: parameters2).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }else if self.selected[0].id == 3{
            Alamofire.request("https://sampleapis.com/rickandmorty/api/episodes/1", method: .put, parameters: parameters3).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }else if self.selected[0].id == 4{
            Alamofire.request("https://sampleapis.com/rickandmorty/api/episodes/1", method: .put, parameters: parameters4).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }
           
    }
    //_-----------------------------------------------------------------------
    func getQuestions(){
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

                for n in 2...24 {
                    self.delQuestions(i: n)
                }
//                    self.updateQuestion()
//                    self.addQuestions()

            } catch {
                print(error)
            }


        }
        task.resume()
    }
   

func delQuestions(i: Int){

    let firstTodoEndpoint: String = "https://sampleapis.com/avatar/api/questions/\(i)"
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
    func addQuestions(){
           let parameters1 = [[
            "question": "What animal did aang have??",
            "possibleAnswers1": "Otter penguin",
            "possibleAnswers2": "Flying bison",
            "possibleAnswers3":"Tiger shark",
            "possibleAnswers4":"Seal",
            "correctAnswer": "Flying bison",
            ],
            [
            "question": "What tribe was Toph from??",
            "possibleAnswers1": "Water Tribes",
            "possibleAnswers2":"Fire Nation",
            "possibleAnswers3":"Air Nomads",
            "possibleAnswers4":"Earth Kingdom",
            "correctAnswer": "Earth Kingdom",
            ],[

            "question": "Who could control blood magic??",
            "possibleAnswers1": "Aang",
            "possibleAnswers2":"Katara",
            "possibleAnswers3":"Zuko",
            "possibleAnswers4":"Toph",
            
            "correctAnswer": "Katara",
           ],[

            "question": "What's wrong with Zuko's face???",
            "possibleAnswers1": "black",
            "possibleAnswers2":"scar",
            "possibleAnswers3":"bald",
            "possibleAnswers4":"blind",
            "correctAnswer": "scar",
            ]]
        as [[String : Any]]
        let parameters2 = [[
          
            "question": "What are these blue fellows called??",
            "possibleAnswers1": "Meeseeks",
            "possibleAnswers2":"Meestakes",
            "possibleAnswers3":"Meepsies",
            "possibleAnswers4":"Meeracles",
            "correctAnswer": "Meeseeks",
            ],[
            "question": "On what matriarchal planet do people live with arms on their heads??",
            "possibleAnswers1": "Gazorpazorp",
            "possibleAnswers2":"The Citadel",
            "possibleAnswers3":"Birdworld",
            "possibleAnswers4":"Nebulon",
        
            "correctAnswer": "Gazorpazorp",
            ],[
            "question": "What is this superhero team called??",
            "possibleAnswers1": "The Vengeancers",
                "possibleAnswers2":"The Vindicators",
                "possibleAnswers3":"The Avengers",
                "possibleAnswers4":"The Revengers",
            "correctAnswer": "The Vindicators",
            
            ],[
            "question": "Who is Rick’s best friend???",
            "possibleAnswers1": "Birdperson",
                "possibleAnswers2":"That sweet guitar",
                "possibleAnswers3":"Rick himself",
                "possibleAnswers4":"Squanchy",
            "correctAnswer": "Birdperson",
        ]
        ]
     as [[String : Any]]
        let parameters3 = [[
           
            "question": "Which part of Bender's apartment does Fry end up living in??",
            "possibleAnswers1": "Benders closet",
            "possibleAnswers2":"Benders car",
            "possibleAnswers3":"Benders garage",
            "possibleAnswers4":"Benders bathroom",
            "correctAnswer": "Benders closet",
            ],[

            "question": "In Mother's Day what does Mom want to become??",
            "possibleAnswers1": "GRuler of the galactic empire",
                "possibleAnswers2":"Supreme overlord of Earth",
                "possibleAnswers3":"President of D.O.O.P.",
                "possibleAnswers4":"Galactic mother of the year"

            ,
            "correctAnswer": "Supreme overlord of Earth",
            ],[
            "question": "Who is Lrrr??",
            "possibleAnswers1":"The lord of known space",
                "possibleAnswers2":"A ruthless space pirate",
                "possibleAnswers3": "The ruler of planet Omicron Persei 8",
                "possibleAnswers4":"The lizard king",

            
            "correctAnswer": "The ruler of planet Omicron Persei 8",
            ],[
            "question": "What type of creature is Dr. Zoidberg???",
            "possibleAnswers1": "He is a Decapodian - A lobster-esque alien",
                "possibleAnswers2":"He is a sewer mutant hiding on the surface of New, New York",
                "possibleAnswers3": "He is a genetically engineered experiment of Professor Farnsworth",
                "possibleAnswers4":"He is a Lobocto - Part lobster, part octopus"
            ,
            "correctAnswer": "He is a Decapodian - A lobster-esque alien",
            
                   
         ]
        ]
        as [[String : Any]]
        let parameters4 = [[
           
            "question": "What is a phobia of Marge's that is discovered right before the family takes a trip??",
            "possibleAnswers1": "Swimming",
            "possibleAnswers2":"Spiders",
            "possibleAnswers3":"Heights",
            "possibleAnswers4":"Flying",

            
            "correctAnswer": "Flying",
            ],[

            "question": "Who says Doh!?",
            "possibleAnswers1":"Bart",
                "possibleAnswers2":"Lisa",
                "possibleAnswers3":"Homer",
                "possibleAnswers4":"Marge",

            
            "correctAnswer": "Homer",
            ],[
            "question": "What does Otto do??",
            "possibleAnswers1": "Salesman in the store",
                "possibleAnswers2":"school teacher",
                "possibleAnswers3":"works as a bartender",
                "possibleAnswers4":"drives the school bus"

            ,
            "correctAnswer": "drives the school bus",
            ],[
            "question": "Who shot Mr Burns???",
            "possibleAnswers1": "Bart",
                "possibleAnswers2":"Maggie",
                "possibleAnswers3":"Homer",
                "possibleAnswers4":"Marge",
            "correctAnswer": "Maggie",
            
         ]
        ]
        as [[String : Any]]

        
        if self.selected[0].id == 1{
            for p in parameters1 {
            Alamofire.request("https://sampleapis.com/avatar/api/questions", method: .post, parameters: p).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }}
        }else if self.selected[0].id == 2{
            for p in parameters2 {
            Alamofire.request("https://sampleapis.com/avatar/api/questions", method: .post, parameters: p).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }
        }else if self.selected[0].id == 3{
            for p in parameters3 {
            Alamofire.request("https://sampleapis.com/avatar/api/questions", method: .post, parameters: p).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }
        }else if self.selected[0].id == 4{
            for p in parameters3 {
            Alamofire.request("https://sampleapis.com/avatar/api/questions", method: .post, parameters: p).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }
        }
        
    }
    func updateQuestion(){
           let parameters1 = [
            "question": "What is aangs natural element?",
            "possibleAnswers1": "earth",
            "possibleAnswers2":"fire",
            "possibleAnswers3":"air",
            "possibleAnswers4":"water",
             "correctAnswer": "air",
             
            ] as [String : Any]
           let parameters2 = [
            
            "question": "What is Rick’s catchphrase??",
            "possibleAnswers1": "What are those things?",
                "possibleAnswers2":"Just take a deep breath.",
                "possibleAnswers3":"Wubba lubba dub dub!",
                "possibleAnswers4":"Great work, Morty.",
            
            "correctAnswer": "Wubba lubba dub dub!",
            
]
           as [String : Any]

        let parameters3 = [
            "question": "Pick the saying that is NOT a catchphrase on Futurama??",
            "possibleAnswers1": "Bite my shiny metal ass!",
            "possibleAnswers2":"I guess I am already here.",
            "possibleAnswers3":"Good news, everyone!",
            "possibleAnswers4":"Crud!",
            
            "correctAnswer": "I guess I am already here.",
            
           ]
        as [String : Any]

        let parameters4 = [
            "question": "What does Homer briefly change his name to??",
            "possibleAnswers1": "Max Power",
            "possibleAnswers2":"Handsome B. Wonderful",
            "possibleAnswers3":"Rembrandt Q. Einstein",
            "possibleAnswers4":"Hercules Rockefeller",
            "correctAnswer": "Max Power",
            
            ]
        as [String : Any]
        if self.selected[0].id == 1{
            
            Alamofire.request("https://sampleapis.com/avatar/api/questions/1", method: .put, parameters: parameters1).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }else if self.selected[0].id == 2{
            Alamofire.request("https://sampleapis.com/avatar/api/questions/1", method: .put, parameters: parameters2).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }else if self.selected[0].id == 3{
            Alamofire.request("https://sampleapis.com/avatar/api/questions/1", method: .put, parameters: parameters3).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }else if self.selected[0].id == 4{
            Alamofire.request("https://sampleapis.com/avatar/api/questions/1", method: .put, parameters: parameters4).responseString{(response) in
                if response.result.isSuccess{
                    print(response)
                }else{
                    return
                }
            }
        }
           
    }
 }
