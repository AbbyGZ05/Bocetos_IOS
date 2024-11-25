//
//  Planets.swift
//  WikiStar
//
//  Created by alumno on 11/11/24.
//


import Foundation

// Estructura que representa una nave espacial
struct Naves: Codable {
    
    // ID de la nave. Es opcional ya que no todas las naves pueden tener un identificador.
   // let id: Int?
    
    // Nombre de la nave (por ejemplo, "Millennium Falcon").
    var name: String
    
    // Modelo de la nave (por ejemplo, "YT-1300 Corellian light freighter").
    var model: String
    
    // El costo de la nave en créditos (por ejemplo, "1000000").
    var cost_in_credits: String
    
    // La longitud de la nave (por ejemplo, "34.37").
    var length: String
    
    // La velocidad máxima de la nave en la atmósfera (por ejemplo, "1050").
    var max_atmosphering_speed: String
    
    // El número de tripulantes necesarios para operar la nave (por ejemplo, "4").
    var crew: String
    
    // El número de pasajeros que la nave puede transportar (por ejemplo, "6").
    var passengers: String
    
    // La capacidad de carga de la nave (por ejemplo, "50000").
    var cargo_capacity: String
    
    // La calificación del sistema de hiperpropulsión de la nave (por ejemplo, "0.5").
    var hyperdrive_rating: String
    
    // La clase o tipo de nave (por ejemplo, "Light freighter").
    var starship_class: String
}

// Estructura que representa la respuesta paginada de la API que devuelve las naves espaciales
struct NavesRespuesta: Codable {
    
    // El número total de naves disponibles (por ejemplo, "37").
    let count: Int
    
    // Un string con la URL de la siguiente página de resultados, si existe.
    let next: String?
    
    // Un string con la URL de la página anterior de resultados, si existe.
    let previous: String?
    
    // Un array de objetos Naves, que contiene las naves de la página actual.
    let results: [Naves]
}
