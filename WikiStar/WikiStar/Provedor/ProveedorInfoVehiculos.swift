//
//  ProveedorInfoVehiculos.swift
//  WikiStar
//
//  Created by alumno on 11/12/24.

import Foundation
import UIKit

class ProveedorInfoVehiculos{
    let url_de_informacion = "https://swapi.dev/api"
    var  lista_de_vehiculos: [Vehiculos] = []
    
    /*
    static var autoreferencia: ProveedorDePublicaciones = {
        // Esta version es solo para añadir configuracion o cosas importatnes durante la inicializacion
        let instancia = ProveedorDePublicaciones()
        return instancia
    }()
     */
    static var autoreferencia = ProveedorInfoVehiculos()
    
    private init() {}
    
    func obtener_vehiculos(que_hacer_al_recibir: @escaping ([Vehiculos]) -> Void) {
        /// Acmodamos la url para descargar en esta funcion los post directamente
        let ubicacion = URL(string: "\(url_de_informacion)/vehicles/")!
        URLSession.shared.dataTask(with: ubicacion) {
                (datos, respuesta, error) in do {
                    if let vehiculos_recibidos = datos{
                        let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(VehiculosRespuesta.self, from: vehiculos_recibidos)
                        self.lista_de_vehiculos = prueba_de_interpretacion_de_datos.results
                       
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
    
    func obtener_vehiculo(id: Int?, que_hacer_al_recibir: @escaping (
        Vehiculos) -> Void) {
     
            print(lista_de_vehiculos)
            que_hacer_al_recibir(lista_de_vehiculos[id!])
    }
    
    func realizar_subida_de_informacion(Vehiculo_nuevo: Vehiculos) {
        // func obtener_publicaicones() async throws -> [Publicacion] {
        let ubicacion = URL(string: url_de_informacion)!
        URLSession.shared.dataTask(with: ubicacion) {
            (datos, respuesta, error) in do {}
        }.resume()
        
    }
    
    // func obtener_publicaicones() async throws -> [Publicacion] {
   
    func obtener_informacion_del_vehiculo(id: Int, que_hacer_al_recibir: @escaping ([Vehiculos]) -> Void) {
            /// Acmodamos la url para descargar en esta funcion los post directamente
            let ubicacion = URL(string: "\(url_de_informacion)posts/\(id)/informacion")!
            URLSession.shared.dataTask(with: ubicacion) {
                    (datos, respuesta, error) in do {
                        if let vehiculos_recibidos = datos{
                            let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([Vehiculos].self, from: vehiculos_recibidos)
                            
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
