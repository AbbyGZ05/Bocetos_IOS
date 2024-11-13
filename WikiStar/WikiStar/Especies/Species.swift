//
//  Species.swift
//  WikiStar
//
//  Created by alumno on 11/6/24.

import Foundation

struct Especies: Codable{
    let id : Int?
    var name : String
    var average_height : String
    var average_lifespan : String
    var language : String
    var homeworld: String?
    
    enum Codinhkeys : CodingKey {
        case id, name, average_height, average_lifespan, language, homeworld
    }
    
}

struct EspeciesRespuesta: Codable {
        let count: Int
        let next: String?
        let previous: String?
        let results: [Especies]
}


