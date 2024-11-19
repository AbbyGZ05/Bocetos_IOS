import UIKit

class PantallaDePlanetasInfo: UIViewController{
    
    let proveedor_De_Informacion_Planeta = ProveedorInfoPlanetas.autoreferencia  // Proveedor de información

    @IBOutlet weak var Nombre: UILabel!
    @IBOutlet weak var Rotacion: UILabel!
    @IBOutlet weak var Orbita: UILabel!
    @IBOutlet weak var Diametro: UILabel!
    @IBOutlet weak var Clima: UILabel!
    @IBOutlet weak var Gravedad: UILabel!
    @IBOutlet weak var Terreno: UILabel!
    @IBOutlet weak var AWA: UILabel!
    @IBOutlet weak var Poblacion: UILabel!
    
    
    public var id_planeta: Int?
    public var planeta: Planetas?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Aseguramos que el controlador de navegación tiene la barra activada
            let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
            controlador_de_navegacion?.activar_navigation_bar(actviar: true)
            
            // Llamar a la función para realizar la descarga de la información
            realizar_descarga_de_informacion_planetas()
        }
        
        // Método para obtener la información de la especie
        func realizar_descarga_de_informacion_planetas() {
            if self.planeta == nil {
                proveedor_De_Informacion_Planeta.obtener_planeta(id: self.id_planeta ?? -1 , que_hacer_al_recibir: { [weak self] (planetas) in
                    self?.planeta = planetas
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
            guard let planeta = self.planeta else { return }
               
               // Asignamos los valores a los UILabels
               Nombre.text = planeta.name
               Rotacion.text = String(format: "%@ hours", planeta.rotation_period)
               Orbita.text = String(format: "%@ days", planeta.orbital_period)
               Diametro.text = String(format: "%@ km", planeta.diameter)
               Clima.text = planeta.climate
               Gravedad.text = planeta.gravity
               Terreno.text = planeta.terrain
               AWA.text = String(format: "%@%%", planeta.surface_water)
               Poblacion.text = String(format: "%@", planeta.population)
            
        }
}


