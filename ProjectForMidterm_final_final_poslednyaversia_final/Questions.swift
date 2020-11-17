//
//  Questions.swift
//  ProjectForMidterm_final_final_poslednyaversia_final
//
//  Created by Koko on 10/18/20.
//

import Foundation

struct Questions: Decodable {
    let question: String
    let possibleAnswers1: String
    let possibleAnswers2: String
    let possibleAnswers3: String
    let possibleAnswers4: String
    let correctAnswer: String
    let id: Int
}


