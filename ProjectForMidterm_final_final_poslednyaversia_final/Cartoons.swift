//
//  Cartoons.swift
//  ProjectForMidterm_final_final_poslednyaversia_final
//
//  Created by Koko on 10/18/20.
//

import Foundation
struct Cartoons : Decodable {
    let id : Int
    let title : String
    let posterURL : String
    let yearsAired: String
    let synopsis: String
    let shortInfo: String
    let genres : String
    let creators : String
}
