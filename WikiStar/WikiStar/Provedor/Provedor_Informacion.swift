//
//  Provedor_Informacion.swift
//  WikiStar
//
//  Created by alumno on 11/7/24.
//

import Foundation
import UIKit

// Clase 'proveedorDeInfromacion' que maneja las interacciones con la API de Star Wars.
class proveedorDeInfromacion {
    // URL base de la API
    let url_de_informacion = "https://swapi.dev/api"
    var lista_de_especies: [Especies] = []  // Array que almacenará las especies obtenidas desde la API
    
    // Instancia estática para acceder a esta clase de manera global
    static var autoreferencia = proveedorDeInfromacion()
    
    // Inicializador privado para asegurar que solo existe una instancia de esta clase
    private init() {}
    
    // Método para obtener las especies de la API
    func obtener_especies(que_hacer_al_recibir: @escaping ([Especies]) -> Void) {
        // Construir la URL de la API para obtener las especies
        let ubicacion = URL(string: "\(url_de_informacion)/species/")!
        
        // Realizar una tarea de red para obtener los datos
        URLSession.shared.dataTask(with: ubicacion) { (datos, respuesta, error) in
            do {
                // Si los datos fueron recibidos correctamente
                if let especies_recibidas = datos {
                    // Decodificar los datos JSON a un objeto de tipo 'EspeciesRespuesta'
                    let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(EspeciesRespuesta.self, from: especies_recibidas)
                    
                    // Guardar las especies recibidas en la lista
                    self.lista_de_especies = prueba_de_interpretacion_de_datos.results
                    
                    // Llamar al cierre (callback) para devolver las especies recibidas
                    que_hacer_al_recibir(prueba_de_interpretacion_de_datos.results)
                }
            } catch {
                // Si ocurre un error al decodificar los datos, se imprime el error
                print("Error -_- \(#function)")
            }
        }.resume()  // Iniciar la tarea de red
    }
    
    // Método para obtener una especie específica por su ID
    func obtener_especie(id: Int?, que_hacer_al_recibir: @escaping (Especies) -> Void) {
        // Imprimir la lista de especies (para depuración)
        print(lista_de_especies)
        
        // Llamar al cierre (callback) con la especie correspondiente al ID
        if let id = id {
            que_hacer_al_recibir(lista_de_especies[id])
        }
    }
    
    // Método para realizar una subida de datos (no implementado)
    func realizar_subida_de_informacion(Especie_nueva: Especies) {
        // Esta función está vacía y no hace nada en su implementación actual
        
        let ubicacion = URL(string: url_de_informacion)!
        
        // Se realiza una tarea de red, pero no se especifica ningún comportamiento
        URLSession.shared.dataTask(with: ubicacion) { (datos, respuesta, error) in
            do {
                // Aquí podrías implementar el código para subir información si fuera necesario
            } catch {
                // Manejo de errores
            }
        }.resume()  // Iniciar la tarea de red
    }
    
    // Método para obtener información detallada sobre una especie específica
    func obtener_informacion_de_la_especie(id: Int, que_hacer_al_recibir: @escaping ([Especies]) -> Void) {
        // Construir la URL para obtener la información detallada de la especie
        let ubicacion = URL(string: "\(url_de_informacion)/posts/\(id)/informacion")!
        
        // Realizar una tarea de red para obtener los datos
        URLSession.shared.dataTask(with: ubicacion) { (datos, respuesta, error) in
            do {
                // Si los datos fueron recibidos correctamente
                if let especies_recibidas = datos {
                    // Decodificar los datos JSON a un objeto de tipo '[Especies]'
                    let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([Especies].self, from: especies_recibidas)
                    
                    // Llamar al cierre (callback) con las especies obtenidas
                    que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                }
            } catch {
                // Si ocurre un error al decodificar los datos, se imprime el error
                print("Error \(#function)")
            }
        }.resume()  // Iniciar la tarea de red
    }
}
