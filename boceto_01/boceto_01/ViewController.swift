//
//  ViewController.swift
//  boceto_01
//
//  Created by alumno on 9/18/24.
//

import UIKit

class ViewController: UIViewController {
    

    @IBSegueAction func al_abrir_la_pantalla(_ coder: NSCoder) -> ControladorCitas? {
        return ControladorCitas(muro_texo: "pio", de_quien:
            "pato", coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

