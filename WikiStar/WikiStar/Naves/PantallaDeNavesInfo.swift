import UIKit

class PantallaDeNavesInfo: UIViewController{
    
    let proveedor_De_Informacion_Nave = ProveedorInfoNaves.autoreferencia  // Proveedor de información

    @IBOutlet weak var Nombre: UILabel!
    @IBOutlet weak var Modelo: UILabel!
    @IBOutlet weak var TamNave: UILabel!
    @IBOutlet weak var Eqwuipo: UILabel!
    @IBOutlet weak var Cargo: UILabel!
    @IBOutlet weak var Pasajeros: UILabel!
    @IBOutlet weak var VelocidadMax: UILabel!
    @IBOutlet weak var Creditos: UILabel!
    @IBOutlet weak var Hyper: UILabel!
    @IBOutlet weak var ClaseNave: UILabel!
    
    
    public var id_nave: Int?
        public var nave: Naves?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Aseguramos que el controlador de navegación tiene la barra activada
            let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
            controlador_de_navegacion?.activar_navigation_bar(actviar: true)
            
            // Llamar a la función para realizar la descarga de la información
            realizar_descarga_de_informacion_naves()
        }
        
        // Método para obtener la información de la especie
        func realizar_descarga_de_informacion_naves() {
            if self.nave == nil {
                proveedor_De_Informacion_Nave.obtener_nave(id: self.id_nave ?? -1 , que_hacer_al_recibir: { [weak self] (naves) in
                    self?.nave = naves
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
            guard let nave = self.nave else { return }
               
            Nombre.text = nave.name
            Modelo.text = nave.model
            TamNave.text = nave.length
            Eqwuipo.text = nave.crew
            Cargo.text = String(format: "%@ toneladas", nave.cargo_capacity)
            Pasajeros.text = "\(nave.passengers) personas"
            VelocidadMax.text = String(format: "%@ km/h", nave.max_atmosphering_speed)
            Creditos.text = String(format: "₡%@", nave.cost_in_credits)
            Hyper.text = nave.hyperdrive_rating
            ClaseNave.text = nave.starship_class

               
            
        }
}


