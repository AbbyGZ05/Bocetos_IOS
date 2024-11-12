//
//  ProveedorInfoVehiculos.swift
//  WikiStar
//
//  Created by alumno on 11/12/24.

import Foundation
import UIKit

class ProveedorInfoNaves{
    let url_de_informacion = "https://swapi.dev/api"
    var  lista_de_naves: [Naves] = []
    
    /*
    static var autoreferencia: ProveedorDePublicaciones = {
        // Esta version es solo para añadir configuracion o cosas importatnes durante la inicializacion
        let instancia = ProveedorDePublicaciones()
        return instancia
    }()
     */
    static var autoreferencia = ProveedorInfoNaves()
    
    private init() {}
    
    func obtener_naves(que_hacer_al_recibir: @escaping ([Naves]) -> Void) {
        /// Acmodamos la url para descargar en esta funcion los post directamente
        let ubicacion = URL(string: "\(url_de_informacion)/starships/")!
        URLSession.shared.dataTask(with: ubicacion) {
                (datos, respuesta, error) in do {
                    if let naves_recibidas = datos{
                        let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(NavesRespuesta.self, from: naves_recibidas)
                        self.lista_de_naves = prueba_de_interpretacion_de_datos.results
                       
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
    
    func obtener_nave(id: Int?, que_hacer_al_recibir: @escaping (
        Naves) -> Void) {
     
            print(lista_de_naves)
            que_hacer_al_recibir(lista_de_naves[id!])
    }
    
    func realizar_subida_de_informacion(Nave_nueva: Naves) {
        // func obtener_publicaicones() async throws -> [Publicacion] {
        let ubicacion = URL(string: url_de_informacion)!
        URLSession.shared.dataTask(with: ubicacion) {
            (datos, respuesta, error) in do {}
        }.resume()
        
    }
    
    // func obtener_publicaicones() async throws -> [Publicacion] {
   
    func obtener_informacion_de_nave(id: Int, que_hacer_al_recibir: @escaping ([Naves]) -> Void) {
            /// Acmodamos la url para descargar en esta funcion los post directamente
            let ubicacion = URL(string: "\(url_de_informacion)posts/\(id)/informacion")!
            URLSession.shared.dataTask(with: ubicacion) {
                    (datos, respuesta, error) in do {
                        if let naves_recibidas = datos{
                            let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([Naves].self, from: naves_recibidas)
                            
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
