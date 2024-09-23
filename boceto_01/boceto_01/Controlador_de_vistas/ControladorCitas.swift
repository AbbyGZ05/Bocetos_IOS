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
    
    var muro_de_texto: String
    var quie_lo_dijo: String
    
    required init? (coder: NSCoder){
        self.muro_de_texto = ""
        self.quie_lo_dijo = ""
        super.init(coder: coder)
        print("Error estas bien wey")
    }
    
    init ?(muro_texo:String, de_quien:String, coder:NSCoder){
        self.muro_de_texto = muro_texo
        self.quie_lo_dijo = de_quien
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inicializar_pantalla()
    }
    func inicializar_pantalla(){
        NombreDeQuienLoDijo.text = self.quie_lo_dijo
        QueDijoMuroTexto.text = self.muro_de_texto
    }
}
