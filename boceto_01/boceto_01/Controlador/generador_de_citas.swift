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
    
    func agregar_cita(que_dijo: String, quien_lo_dijo: String){
        let cita_generada = cita( quien_lo_dijo:quien_lo_dijo, que_dijo:que_dijo)
        
        citas_creadas.append(cita_generada)
    }
}
