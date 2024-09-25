//
//  ControladorCitas.swift
//  boceto_01
//
//  Created by alumno on 9/23/24.
//

import UIKit

class ControladorCitas: UIViewController {
    
    @IBOutlet weak var NombreDeQuienLoDijo: UILabel!
    @IBOutlet weak var QueDijoMuroTexto: UILabel!

    var cita_actual: cita
    
    
    required init? (coder: NSCoder){
        self.cita_actual = cita(quien_lo_dijo: "Desarrollador", que_dijo: "Reportalo yaaaaa")
        super.init(coder: coder)
        print("Error estas bien wey")
    }
    
    init ?(cita_para_citar: cita, coder:NSCoder){
        self.cita_actual = cita_para_citar
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inicializar_pantalla()
    }
    func inicializar_pantalla(){
        NombreDeQuienLoDijo.text = cita_actual.nombre
        QueDijoMuroTexto.text = cita_actual.texto
    }
}
