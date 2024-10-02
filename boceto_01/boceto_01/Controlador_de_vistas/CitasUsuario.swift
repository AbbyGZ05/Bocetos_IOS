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
    var opantalla_anterior: ViewController? = nil
    
    @IBOutlet weak var Nombre_de_quien_lo_dijo: UITextField!
    @IBOutlet weak var Que_es_lo_que_dijo: UITextField!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init ?(pantalla_anterior: ViewController, coder:NSCoder){
        self.opantalla_anterior = pantalla_anterior
        super.init(coder: coder)
    }
    
    @IBAction func Agregar_cita_nueva(_ sender: UIButton) {
    if let quienLoDijo = Nombre_de_quien_lo_dijo.text, !quienLoDijo.isEmpty,
           let queDijo = Que_es_lo_que_dijo.text, !queDijo.isEmpty {
            cita_creada = cita(quien_lo_dijo: quienLoDijo, que_dijo: queDijo)

        
        opantalla_anterior?.citas_disponibles.agregar_cita(cita_creada!)
        //Actualizar cantidad de citas
        opantalla_anterior?.actualizar_cantidad()
        
        //Cerrar vista actual
        dismiss(animated: true, completion: nil)

        
        } else {
            // Puedes mostrar un mensaje de error si los campos están vacíos
            //Pop UP para mensajes de alerta.
            let alert = UIAlertController(title: "Error", message: "Por favor, completa todos los campos.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }



}
