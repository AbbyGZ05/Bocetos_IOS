//
//  Cita.swift
//  boceto_01
//
//  Created by alumno on 9/18/24.
//

import Foundation

struct cita{
    var nombre:String
    var texto:String

    init(quien_Lo_Dijo:String, Que_Dijo:String){
        nombre = quien_Lo_Dijo
        texto = Que_Dijo
    }
}
