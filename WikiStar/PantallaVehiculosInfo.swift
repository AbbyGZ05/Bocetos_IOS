import UIKit

class PantallaVehiculosInfo: UIViewController{
    
    let proveedor_De_Informacion_Vehiculo = ProveedorInfoVehiculos.autoreferencia  // Proveedor de información

    
    @IBOutlet weak var Nombre: UILabel!
    @IBOutlet weak var Modelo: UILabel!
    @IBOutlet weak var CostCred: UILabel!
    @IBOutlet weak var Tamano: UILabel!
    @IBOutlet weak var VelocidadMax: UILabel!
    @IBOutlet weak var Equipo: UILabel!
    @IBOutlet weak var NumPasajeros: UILabel!
    @IBOutlet weak var CapCarga: UILabel!
    @IBOutlet weak var ClaseDeVehiculo: UILabel!
    
    
    
    public var id_vehiculo: Int?
        public var vehiculo: Vehiculos?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Aseguramos que el controlador de navegación tiene la barra activada
            let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
            controlador_de_navegacion?.activar_navigation_bar(actviar: true)
            
            // Llamar a la función para realizar la descarga de la información
            realizar_descarga_de_informacion_vehiculos()
        }
        
        // Método para obtener la información de la especie
        func realizar_descarga_de_informacion_vehiculos() {
            if self.vehiculo == nil {
                proveedor_De_Informacion_Vehiculo.obtener_vehiculo(id: self.id_vehiculo ?? -1 , que_hacer_al_recibir: { [weak self] (Vehiculos) in
                    self?.vehiculo = Vehiculos
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
            guard let vehiculo = self.vehiculo else { return }
            

            Nombre.text = vehiculo.name
            Modelo.text = vehiculo.model
            CostCred.text = String(format: "₡%@", vehiculo.cost_in_credits )
            Tamano.text = vehiculo.length
            VelocidadMax.text = String(format: "%@ km/h", vehiculo.max_atmosphering_speed )
            Equipo.text = vehiculo.crew
            NumPasajeros.text = "\(vehiculo.passengers ) personas"
            CapCarga.text = String(format: "%@ toneladas", vehiculo.cargo_capacity )
            ClaseDeVehiculo.text = vehiculo.vehicle_class
              
           
        }
}

