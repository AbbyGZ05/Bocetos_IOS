//
//  mod_navegador_principal.swift
//  WikiStar
//
//  Created by alumno on 11/7/24.
//

import UIKit

class mod_navegador_principal: UINavigationController {
    
    // Método que se llama cuando la vista del controlador de navegación ha sido cargada
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Desactivamos la barra de navegación al inicio
        // Esto es opcional, ya que se ha comentado.
        // self.navigationBar.isTranslucent = true  // Deja que el contenido se muestre detrás de la barra (opcional).
        // self.navigationBar.backgroundColor = .black  // Establece el color de fondo de la barra de navegación (opcional).
        // self.hidesBarsOnSwipe = true  // Habilita que la barra se oculte al hacer un desplazamiento hacia arriba (opcional).
        
        // Llama a la función para activar o desactivar la barra de navegación, pasando 'false' por defecto.
        activar_navigation_bar(actviar: false)
    }
    
    // Método que permite activar o desactivar la visibilidad de la barra de navegación.
    func activar_navigation_bar(actviar: Bool) {
        // Si 'actviar' es 'true', muestra la barra de navegación; si es 'false', la oculta.
        self.navigationBar.isHidden = !actviar
    }
}
