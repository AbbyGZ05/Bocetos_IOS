//
//  Planets.swift
//  WikiStar
//
//  Created by alumno on 11/11/24.
//

import Foundation

struct Planetas: Codable{
    
    var id : Int {
        get {return 0}
    }
    var name: String
    var rotation_period: String
    var orbital_period: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surface_water: String
    var population: String
    
}

struct PlanetasRespuesta: Codable {
        let count: Int
        let next: String?
        let previous: String?
        let results: [Planetas]
}


