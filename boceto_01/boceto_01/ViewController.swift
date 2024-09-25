//
//  ViewController.swift
//  boceto_01
//
//  Created by alumno on 9/18/24.
//

import UIKit

class ViewController: UIViewController {
    
    var citaParEnviar: cita = cita(quien_lo_dijo: "Pato", que_dijo: "pio pio")
    var citas_disponibles : Generador_De_Citas = Generador_De_Citas()

    override func viewDidLoad() {
        citas_disponibles.generar_citas_falsas()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBSegueAction func al_abrir_la_pantalla(_ coder: NSCoder) -> ControladorCitas? {
        return ControladorCitas(cita_para_citar: citas_disponibles.obtener_cita_aleatoria(), coder: coder)
    }




}

