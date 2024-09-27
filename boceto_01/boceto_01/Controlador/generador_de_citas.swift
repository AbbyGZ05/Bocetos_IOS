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
    
    func agregar_cita_manual(_ que_dijo: String, quien_lo_dijo: String){
        let cita_generada = cita( quien_lo_dijo:quien_lo_dijo, que_dijo:que_dijo)
        
        citas_creadas.append(cita_generada)
    }
    func agregar_cita(_ cita_nueva: cita){
        citas_creadas.append(cita_nueva)
    }
    
    func generar_citas_falsas(){
        self.agregar_cita_manual("En las sombras, donde la oscuridad es mi única compañera, guardo un secreto explosivo. Un poder que podría cambiar el mundo, si tan solo tuviera el valor de liberarlo",
                                 quien_lo_dijo: "Creeper"
        )
        
        self.agregar_cita_manual("¡La vida es corta, ¡explota al máximo!",
                                 quien_lo_dijo: "Creeper"
        )
        
        self.agregar_cita_manual("GRrrrrr grrr grrr GRRRRR grrrgGRGRh",
                                 quien_lo_dijo: "Zombie"
        )
        
        self.agregar_cita_manual("Solia ser un explorador como tu... Pero me dieron con una flecha en la rodilla",
                             quien_lo_dijo: "Guardia"
           )
       }
    func obtener_cita_aleatoria() -> cita{
        var cita_para_regresar: cita
        cita_para_regresar = citas_creadas[Int.random(in: 0...citas_creadas.count-1)]
        
        return cita_para_regresar
    }
}
