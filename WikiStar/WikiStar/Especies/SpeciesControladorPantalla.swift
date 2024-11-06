//
//  SpeciesControladorPantalla.swift
//  WikiStar
//
//  Created by alumno on 11/6/24.
//

import Foundation
@MainActor
class SpeciesControladorPantalla: ObservableObject{
    struct Retuned : Codable {
        var next : String?
        var results : [Species]
    }
    
    @Published var speciesArray:[Species]
    var URLstring = "https://swapi.dev/api/species/"
    
    func getData() async{
        print ("Accediendo a la URL \(URLstring)")
        
        guard let url = URL (string : URLstring) else {
            print("error")
            return
        }
        do {
            let (data, _ ) = try await URLSession.shared.data(from:URL)
        }
        do{
            let returned = try JSONDecoder().decode(Retuned.self, from: data)
        }
        catch{
            
        }
    }
}
