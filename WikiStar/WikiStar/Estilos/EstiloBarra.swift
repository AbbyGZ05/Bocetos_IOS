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

        // Personalizar la barra de navegación sin crear una subclase
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
