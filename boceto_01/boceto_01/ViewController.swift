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

    @IBOutlet weak var Labelcito: UILabel!
    
    override func viewDidLoad() {
        citas_disponibles.generar_citas_falsas()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        actualizar_cantidad()
    }
    
    func actualizar_cantidad(){
        Labelcito.text = String(citas_disponibles.citas_creadas.count)
    }
    
    @IBSegueAction func al_abrir_la_pantalla(_ coder: NSCoder) -> ControladorCitas? {
        return ControladorCitas(cita_para_citar: citas_disponibles.obtener_cita_aleatoria(), coder: coder)
    }
    
    @IBSegueAction func abrir_pantalla_de_agregar_cita(_ coder: NSCoder) -> ControladorAgregarCitasUsuario? {
        return ControladorAgregarCitasUsuario(pantalla_anterior: self, coder: coder)
    }
    @IBAction func volver_al_inicio(segue: UIStoryboardSegue) {
        // Simplemente actualiza la cantidad de citas sin agregar ninguna.
        actualizar_cantidad()
    }
}



