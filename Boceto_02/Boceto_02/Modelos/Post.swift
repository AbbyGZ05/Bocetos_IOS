//
//  Post.swift
//  Boceto_02
//
//  Created by alumno on 10/9/24.
//

import Foundation

struct publicacion: Decodable{
    //Decodable : permmite converit informacion json a un modelo de swift
    //Encodable: permite convertir un modelo de sift a json
    //Codable: ambas al mismo tiempo
    var id: Int
    var userId: Int
    var title: String
    var body: String
}
