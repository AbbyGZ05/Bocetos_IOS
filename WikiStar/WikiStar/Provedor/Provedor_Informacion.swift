//
//  Provedor_Informacion.swift
//  WikiStar
//
//  Created by alumno on 11/7/24.
//

import Foundation
import UIKit

class proveedorDeInfromacion{
    let url_de_informacion = "https://swapi.dev/api"
    var  lista_de_especies: [Especies] = []
    
    /*
    static var autoreferencia: ProveedorDePublicaciones = {
        // Esta version es solo para añadir configuracion o cosas importatnes durante la inicializacion
        let instancia = ProveedorDePublicaciones()
        return instancia
    }()
     */
    static var autoreferencia = proveedorDeInfromacion()
    
    private init() {}
    
    func obtener_especies(que_hacer_al_recibir: @escaping ([Especies]) -> Void) {
        /// Acmodamos la url para descargar en esta funcion los post directamente
        let ubicacion = URL(string: "\(url_de_informacion)/species/")!
        URLSession.shared.dataTask(with: ubicacion) {
                (datos, respuesta, error) in do {
                    if let especies_recibidas = datos{
                        let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(EspeciesRespuesta.self, from: especies_recibidas)
                        
                        self.lista_de_especies = prueba_de_interpretacion_de_datos.results
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
    
    func obtener_especie(id: Int?, que_hacer_al_recibir: @escaping (
        Especies) -> Void) {
            /*
        /// Acmodamos la url para descargar en esta funcion los post directamente
        let ubicacion = URL(string: "\(url_de_informacion)posts/\(id)")!
        URLSession.shared.dataTask(with: ubicacion) {
                (datos, respuesta, error) in do {
                    if let especies_recibidas = datos{
                        let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(Especies.self, from: especies_recibidas)
                        
                        que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                    }
                    else {
                        print(respuesta)
                    }
                } catch {
                    print("Error \(#function)")
                }
        }.resume()
             */
            print(lista_de_especies)
            que_hacer_al_recibir(lista_de_especies[id!])
    }
    
    func realizar_subida_de_informacion(Especie_nueva: Especies) {
        // func obtener_publicaicones() async throws -> [Publicacion] {
        let ubicacion = URL(string: url_de_informacion)!
        URLSession.shared.dataTask(with: ubicacion) {
            (datos, respuesta, error) in do {}
        }.resume()
        
    }
    
    // func obtener_publicaicones() async throws -> [Publicacion] {
   
    func obtener_informacion_de_la_especie(id: Int, que_hacer_al_recibir: @escaping ([Especies]) -> Void) {
            /// Acmodamos la url para descargar en esta funcion los post directamente
            let ubicacion = URL(string: "\(url_de_informacion)posts/\(id)/informacion")!
            URLSession.shared.dataTask(with: ubicacion) {
                    (datos, respuesta, error) in do {
                        if let especies_recibidas = datos{
                            let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([Especies].self, from: especies_recibidas)
                            
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
