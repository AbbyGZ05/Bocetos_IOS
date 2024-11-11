//
//  ProveedorInfoPlanetas.swift
//  WikiStar
//
//  Created by alumno on 11/11/24.
//

import Foundation
import UIKit

class ProveedorInfoPlanetas{
    let url_de_informacion = "https://swapi.dev/api"
    var  lista_de_planetas: [Planetas] = []
    
    /*
    static var autoreferencia: ProveedorDePublicaciones = {
        // Esta version es solo para añadir configuracion o cosas importatnes durante la inicializacion
        let instancia = ProveedorDePublicaciones()
        return instancia
    }()
     */
    static var autoreferencia = ProveedorInfoPlanetas()
    
    private init() {}
    
    func obtener_planetas(que_hacer_al_recibir: @escaping ([Planetas]) -> Void) {
        /// Acmodamos la url para descargar en esta funcion los post directamente
        let ubicacion = URL(string: "\(url_de_informacion)/planets/")!
        URLSession.shared.dataTask(with: ubicacion) {
                (datos, respuesta, error) in do {
                    if let planetas_recibidos = datos{
                        let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(PlanetasRespuesta.self, from: planetas_recibidos)
                        
                        self.lista_de_planetas = prueba_de_interpretacion_de_datos.results
                        //print(prueba_de_interpretacion_de_datos)
                        que_hacer_al_recibir(prueba_de_interpretacion_de_datos.results)
                    }
                    else {
                        print(respuesta)
                    }
                } catch {
                    print("Error -_- \(#function)")
                }
        }.resume()
    }
    
    func obtener_planeta(id: Int?, que_hacer_al_recibir: @escaping (
        Planetas) -> Void) {
     
            print(lista_de_planetas)
            que_hacer_al_recibir(lista_de_planetas[id!])
    }
    
    func realizar_subida_de_informacion(Planeta_nueva: Planetas) {
        // func obtener_publicaicones() async throws -> [Publicacion] {
        let ubicacion = URL(string: url_de_informacion)!
        URLSession.shared.dataTask(with: ubicacion) {
            (datos, respuesta, error) in do {}
        }.resume()
        
    }
    
    // func obtener_publicaicones() async throws -> [Publicacion] {
   
    func obtener_informacion_del_planeta(id: Int, que_hacer_al_recibir: @escaping ([Planetas]) -> Void) {
            /// Acmodamos la url para descargar en esta funcion los post directamente
            let ubicacion = URL(string: "\(url_de_informacion)posts/\(id)/informacion")!
            URLSession.shared.dataTask(with: ubicacion) {
                    (datos, respuesta, error) in do {
                        if let planetas_recibidos = datos{
                            let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([Planetas].self, from: planetas_recibidos)
                            
                            que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                        }
                        else {
                            print(respuesta)
                        }
                    } catch {
                        print("Error \(#function)")
                    }
            }.resume()
        }
}
