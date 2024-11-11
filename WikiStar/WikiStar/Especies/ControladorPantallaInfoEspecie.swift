import UIKit

class ControladorPantallaInfoEspecie: UIViewController{
    
    let proveedor_De_Informacion = proveedorDeInfromacion.autoreferencia  // Proveedor de información


    @IBOutlet weak var Nombre: UILabel!
    @IBOutlet weak var Altura: UILabel!
    @IBOutlet weak var vida: UILabel!
    @IBOutlet weak var Lenguaje: UILabel!
    @IBOutlet weak var Origen: UILabel!
    
    public var id_especie: Int?
        public var especie: Especies?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Aseguramos que el controlador de navegación tiene la barra activada
            let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
            controlador_de_navegacion?.activar_navigation_bar(actviar: true)
            
            // Llamar a la función para realizar la descarga de la información
            realizar_descarga_de_informacion()
        }
        
        // Método para obtener la información de la especie
        func realizar_descarga_de_informacion() {
            if self.especie == nil {
                proveedor_De_Informacion.obtener_especie(id: self.id_especie ?? -1 , que_hacer_al_recibir: { [weak self] (especies) in
                    self?.especie = especies
                    DispatchQueue.main.async {
                        self?.actualizarEtiquetas()  // Actualizar las etiquetas con la info recibida
                    }
                })
            } else {
                // Si ya tienes la especie cargada, actualiza las etiquetas inmediatamente
                actualizarEtiquetas()
            }
        }
        
        // Método para actualizar las etiquetas con la información de la especie
        func actualizarEtiquetas() {
            guard let especie = self.especie else { return }
            
            Nombre.text = especie.name
            Altura.text = String(format: "%@ cm", especie.average_height)
            vida.text = String(format: "%@ años", especie.average_lifespan)
            Lenguaje.text = especie.language
            Origen.text = especie.homeworld
        }
}

