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
    
    // Propiedades para almacenar el ID y los datos descargados del vehículo
    public var id_vehiculo: Int?
    public var vehiculo: Vehiculos?
    
    // Método que se llama cuando la vista está lista para ser cargada
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Asegura que la barra de navegación está activada en el controlador actual
        let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
        controlador_de_navegacion?.activar_navigation_bar(actviar: true)
        
        // Llama al método para descargar la información del vehículo
        realizar_descarga_de_informacion_vehiculos()
        
        // Personaliza la barra de navegación: color de fondo negro y texto blanco
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Crea un botón de retroceso con una imagen personalizada
        let backButton = UIBarButtonItem(
            image: UIImage(named: "BotonBack"),  // Imagen personalizada del botón de retroceso
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)  // Acción que se ejecuta al hacer clic
        )
        
        // Ajusta el tamaño del botón de retroceso usando 'imageInsets'
        backButton.imageInsets = UIEdgeInsets(top: 0, left: -130, bottom: 0, right: 0)
        
        // Establece el botón de retroceso en la barra de navegación
        navigationItem.leftBarButtonItem = backButton
    }
    
    // Acción cuando se presiona el botón de retroceso
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)  // Vuelve a la pantalla anterior
    }
    
    // Método para descargar la información del vehículo usando su ID
    func realizar_descarga_de_informacion_vehiculos() {
        if self.vehiculo == nil {
            // Si no se ha descargado aún la información del vehículo, se solicita a la API
            proveedor_De_Informacion_Vehiculo.obtener_vehiculo(id: self.id_vehiculo ?? -1 , que_hacer_al_recibir: { [weak self] (Vehiculos) in
                // Guarda los datos del vehículo descargado en la propiedad 'vehiculo'
                self?.vehiculo = Vehiculos
                DispatchQueue.main.async {
                    // Después de recibir la información, actualiza las etiquetas en la UI
                    self?.actualizarEtiquetas()
                }
            })
        } else {
            // Si la información ya está disponible, actualiza las etiquetas directamente
            actualizarEtiquetas()
        }
    }
    
    // Método para actualizar las etiquetas de la interfaz con la información del vehículo
    func actualizarEtiquetas() {
        // Asegura que la propiedad 'vehiculo' contiene datos
        guard let vehiculo = self.vehiculo else { return }
        
        // Actualiza las etiquetas de la interfaz con los datos del vehículo
        Nombre.text = vehiculo.name  // Nombre del vehículo
        Modelo.text = vehiculo.model  // Modelo del vehículo
        CostCred.text = String(format: "₡ %@", vehiculo.cost_in_credits)  // Costo del vehículo en créditos
        Tamano.text = vehiculo.length  // Tamaño del vehículo
        VelocidadMax.text = String(format: "%@ km/h", vehiculo.max_atmosphering_speed)  // Velocidad máxima
        Equipo.text = String(format: "Crew %@", vehiculo.crew)  // Número de miembros de la tripulación
        NumPasajeros.text = "\(vehiculo.passengers) People"  // Número de pasajeros
        CapCarga.text = String(format: "%@ Tons.", vehiculo.cargo_capacity)  // Capacidad de carga en toneladas
        ClaseDeVehiculo.text = vehiculo.vehicle_class  // Clase del vehículo
        
        // Usar el diccionario de imágenes para obtener y mostrar la imagen correspondiente
        let nombreVehicle = vehiculo.name  // Obtiene el nombre del vehículo
        
        // Verifica si el nombre del vehículo está en el diccionario de imágenes
        if let imagen = diccionarioDeImagenesVehiculos[nombreVehicle] {
            // Si existe una imagen en el diccionario, la asigna
            ImagenVehiculos.image = imagen
        } else {
            // Si no existe una imagen en el diccionario, asigna una imagen por defecto
            ImagenVehiculos.image = UIImage(named: "imagen_por_defecto")
        }
    }
    
}
