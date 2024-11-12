//
//  Planets.swift
//  WikiStar
//
//  Created by alumno on 11/11/24.
//


import Foundation

struct Naves: Codable{
    let id : Int?
    var name : String
    var model : String
    var cost_in_credits : String
    var length : String
    var max_atmosphering_speed : String
    var crew : String
    var passengers : String
    var cargo_capacity : String
    var hyperdrive_rating : String
    var starship_class : String
}

struct NavesRespuesta: Codable {
        let count: Int
        let next: String?
        let previous: String?
        let results: [Naves]
}
