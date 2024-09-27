//
//  CitasUsuario.swift
//  boceto_01
//
//  Created by alumno on 9/25/24.
//

import Foundation
import UIKit
class ControladorAgregarCitasUsuario: UIViewController {
    
    var quien_lo_dice: String = ""
    var que_es_lo_que_dice: String = ""
    
    var cita_creada: cita? = nil
    
    @IBOutlet weak var Nombre_de_quien_lo_dijo: UITextField!
    @IBOutlet weak var Que_es_lo_que_dijo: UITextField!
    
    @IBAction func Agregar_cita_nueva(_ sender: UIButton) {
        cita_creada = cita(quien_lo_dijo:Nombre_de_quien_lo_dijo.text!,
                           que_dijo: Que_es_lo_que_dijo.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }



}
