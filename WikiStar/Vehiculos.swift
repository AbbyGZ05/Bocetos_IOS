//
//  Vehiculos.swift
//  WikiStar
//
//  Created by alumno on 11/12/24.
//

import Foundation

struct Vehiculos: Codable{
    
    //let id : Int?
    var name : String
    var model: String
    var cost_in_credits : String
    var length : String
    var max_atmosphering_speed : String
    var crew : String
    var passengers : String
    var cargo_capacity: String
    var vehicle_class : String
    
}

struct VehiculosRespuesta: Codable {
        let count: Int
        let next: String?
        let previous: String?
        let results: [Vehiculos]
}
