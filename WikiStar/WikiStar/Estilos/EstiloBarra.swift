//
//  EstiloBarra.swift
//  WikiStar
//
//  Created by alumno on 11/20/24.
//


import UIKit

class EstiloBarra: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Personalizar la barra de navegación sin crear una subclase de UINavigationController
        self.navigationController?.navigationBar.barTintColor = .black // Establece el color de fondo de la barra de navegación
        self.navigationController?.navigationBar.tintColor = .white // Establece el color de los botones (por ejemplo, el de "back" o los botones personalizados) en blanco
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white] // Establece el color del texto del título de la barra de navegación en blanco
    }
}
