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
            if(lista_de_planetas.count > 1){
                ///print(lista_de_planetas)
                for planetoide in self.lista_de_planetas{
                    print(planetoide.id)
                }
                if let planeta = self.lista_de_planetas.first(where: {$0.id == id}){
                    print("Planeta ubicado: \(planeta)")
                    que_hacer_al_recibir(planeta)
                    
                }
                else{
                    print("Oye, no esta en tu lista de planetas, que paso mi compa")
                }
            }
            
            else{
                let ubicacion = URL(string: "\(url_de_informacion)/planets/\(id)")!
                URLSession.shared.dataTask(with: ubicacion) {
                        (datos, respuesta, error) in do {
                            if let planetas_recibidos = datos{
                                let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(Planetas.self, from: planetas_recibidos)
                                
                                
                                //print(prueba_de_interpretacion_de_datos)
                                que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                            }
                            else {
                                print("___AQUI no deberia suceder algo")
                            }
                        } catch {
                            print("Error -_- \(#function)")
                        }
                }.resume()
            }
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
