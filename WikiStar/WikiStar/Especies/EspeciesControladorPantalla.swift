//
//  EspeciesControladorPantalla.swift
//  WikiStar
//
//  Created by alumno on 11/6/24.
//

import Foundation

struct Species:     Identifiable, Codable{
    let id = UUID().uuidString
    var name : String
    var average_height : Float
    var average_lifespan : Int
    var language : String
    var homeworld: String
    
    enum Codinhkeys : CodingKey {
        case name, average_height, average_lifespan, language, homeworld
    }
}
