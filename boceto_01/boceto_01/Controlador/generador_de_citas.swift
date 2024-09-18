//
//  generador_de_citas.swift
//  boceto_01
//
//  Created by alumno on 9/18/24.
//

import Foundation
class Generador_De_Citas{
    var citas_creadas : Array<cita>
    
    init(){
        citas_creadas = []
    }
    
    func agregar_cita(quienDijo:String, queDijo: String){
        var cita_generada = cita(quienLoDijo:queDijo, QueDijo: queDijo)
        
        citas_creadas.append(cita_generada)
    }
}
