import UIKit

class PantallaVehiculosInfo: UIViewController{
    
    // Diccionario de imágenes, mapeando el nombre de la especie a una imagen
    let diccionarioDeImagenesVehiculos: [String: UIImage] = [
        "Sand Crawler": UIImage(named: "SandCrawler.png")!,
        "T-16 skyhopper": UIImage(named: "T16Sky.png")!,
        "X-34 landspeeder": UIImage(named: "X34Land.png")!,
        "TIE/LN starfighter": UIImage(named: "TieLN.png")!,
        "Snowspeeder": UIImage(named: "Snowspeeder.png")!,
        "TIE bomber": UIImage(named: "TieBomber.png")!,
        "AT-AT": UIImage(named: "Atat.png")!,
        "AT-ST": UIImage(named: "Atst.png")!,
        "Storm IV Twin-Pod cloud car": UIImage(named: "StormIV.png")!,
        "Sail barge": UIImage(named: "SailBarge.png")!,
        
    ]
    
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
    @IBOutlet weak var ImagenVehiculos: UIImageView!
    
    
    public var id_vehiculo: Int?
        public var vehiculo: Vehiculos?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Aseguramos que el controlador de navegación tiene la barra activada
            let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
            controlador_de_navegacion?.activar_navigation_bar(actviar: true)
            
            // Llamar a la función para realizar la descarga de la información
            realizar_descarga_de_informacion_vehiculos()
            // Personalizar la barra de navegación
                   self.navigationController?.navigationBar.barTintColor = .black
                   self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                   
                   // Crear el botón de retroceso con una imagen personalizada
                   let backButton = UIBarButtonItem(
                       image: UIImage(named: "BotonBack"), // Imagen del botón de retroceso
                       style: .plain,
                       target: self,
                       action: #selector(backButtonTapped) // Acción al hacer clic
                   )
                   
                   // Ajustamos el tamaño del botón
                   backButton.imageInsets = UIEdgeInsets(top: 0, left: -130, bottom: 0, right: 0) // Ajustar según sea necesario
                   
                   // Establecer el botón de retroceso en la barra de navegación
                   navigationItem.leftBarButtonItem = backButton
               }
               
               // Acción del botón de retroceso
               @objc func backButtonTapped() {
                  
                   navigationController?.popViewController(animated: true)
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
            CostCred.text = String(format: "₡ %@", vehiculo.cost_in_credits )
            Tamano.text = vehiculo.length
            VelocidadMax.text = String(format: "%@ km/h", vehiculo.max_atmosphering_speed )
            Equipo.text = String(format: "Crew %@", vehiculo.crew)
            NumPasajeros.text = "\(vehiculo.passengers ) People"
            CapCarga.text = String(format: "%@ Tons.", vehiculo.cargo_capacity )
            ClaseDeVehiculo.text = vehiculo.vehicle_class
              
           
            // Usar el diccionario de imágenes para obtener y mostrar la imagen correspondiente
            let nombreVehicle = vehiculo.name
            
                if let imagen = diccionarioDeImagenesVehiculos[nombreVehicle] {
                    ImagenVehiculos.image = imagen
                } else {
                    // Si no se encuentra la imagen, muestra una imagen por defecto
                    ImagenVehiculos.image = UIImage(named: "imagen_por_defecto")
                }
            }
        }


