import UIKit

class PantallaDeNavesInfo: UIViewController{
    
    let proveedor_De_Informacion_Nave = ProveedorInfoNaves.autoreferencia  // Proveedor de información
    
    let diccionarioDeImagenesNaves: [String: UIImage] = [
        "CR90 corvette": UIImage(named: "cr90Corvette.png")!,
        "Star Destroyer": UIImage(named: "StarDestrpyer.png")!,
        "Sentinel-class landing craft": UIImage(named: "SentimelClassL.png")!,
        "Death Star": UIImage(named: "EstrellaMuerte.png")!,
        "Millennium Falcon": UIImage(named: "Falcon.png")!,
        "Y-wing": UIImage(named: "Ywing.png")!,
        "X-wing": UIImage(named: "Xwing.png")!,
        "TIE Advanced x1": UIImage(named: "TieA1.png")!,
        "Executor": UIImage(named: "Executer.png")!,
        "Rebel transport": UIImage(named: "RebelTra.png")!,
        
    ]
    
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
    @IBOutlet weak var ImagenNave: UIImageView!
    
    // Este controlador maneja la pantalla de detalles de una nave espacial
    public var id_nave: Int?   // ID de la nave seleccionada, que se usará para cargar la información de la nave desde la API
    public var nave: Naves?    // Objeto de tipo Naves donde se almacenará la información descargada de la API
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Aseguramos que el controlador de navegación tiene la barra de navegación activada
        let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
        controlador_de_navegacion?.activar_navigation_bar(actviar: true)  // Activamos la barra de navegación en el controlador
        
        // Llamar a la función para realizar la descarga de la información de la nave
        realizar_descarga_de_informacion_naves()
        
        // Personalización de la barra de navegación
        self.navigationController?.navigationBar.barTintColor = .black  // Establece el color de fondo de la barra de navegación en negro
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]  // Establece el color del texto del título en blanco
        
        // Crear el botón de retroceso con una imagen personalizada
        let backButton = UIBarButtonItem(
            image: UIImage(named: "BotonBack"), // Imagen del botón de retroceso
            style: .plain,
            target: self,
            action: #selector(backButtonTapped) // Acción al hacer clic en el botón de retroceso
        )
        
        // Ajustamos el tamaño del botón de retroceso usando 'imageInsets'
        backButton.imageInsets = UIEdgeInsets(top: 0, left: -130, bottom: 0, right: 0)  // Ajustar según sea necesario
        
        // Establecer el botón de retroceso en la barra de navegación
        navigationItem.leftBarButtonItem = backButton
    }
    
    // Acción del botón de retroceso
    @objc func backButtonTapped() {
        // Volver a la pantalla anterior en el controlador de navegación
        navigationController?.popViewController(animated: true)
    }
    
    // Método para obtener la información de la nave usando su ID
    func realizar_descarga_de_informacion_naves() {
        if self.nave == nil {
            // Si aún no tenemos la información de la nave, la descargamos desde la API
            proveedor_De_Informacion_Nave.obtener_nave(id: self.id_nave ?? -1 , que_hacer_al_recibir: { [weak self] (naves) in
                // Guardamos la información de la nave en la propiedad nave
                self?.nave = naves
                DispatchQueue.main.async {
                    // Después de la descarga, actualizamos las etiquetas con los datos recibidos
                    self?.actualizarEtiquetas()
                }
            })
        } else {
            // Si ya tenemos la información de la nave, actualizamos las etiquetas directamente
            actualizarEtiquetas()
        }
    }
    
    // Método para actualizar las etiquetas de la pantalla con la información de la nave
    func actualizarEtiquetas() {
        guard let nave = self.nave else { return }  // Aseguramos que 'nave' no sea nil
        
        // Actualizamos los campos de la UI con la información descargada
        Nombre.text = nave.name  // Nombre de la nave
        Modelo.text = nave.model  // Modelo de la nave
        TamNave.text = nave.length  // Longitud de la nave
        Eqwuipo.text = String(format: "Crew %@", nave.crew)  // Número de miembros de la tripulación
        Cargo.text = String(format: "%@ Tons.", nave.cargo_capacity)  // Capacidad de carga de la nave
        Pasajeros.text = "\(nave.passengers) people"  // Número de pasajeros que puede transportar
        VelocidadMax.text = String(format: "%@ km/h", nave.max_atmosphering_speed)  // Velocidad máxima en la atmósfera
        Creditos.text = String(format: "₡ %@", nave.cost_in_credits)  // Costo en créditos
        Hyper.text = String(format: "Class %@",nave.hyperdrive_rating)  // Calificación del sistema de hiperpropulsión
        ClaseNave.text = nave.starship_class  // Clase de la nave
        
        // Usar el diccionario de imágenes para obtener y mostrar la imagen correspondiente
        let nombreNave = nave.name  // Obtener el nombre de la nave
        
        // Si el nombre de la nave está en el diccionario de imágenes, asignamos la imagen correspondiente
        if let imagen = diccionarioDeImagenesNaves[nombreNave] {
            ImagenNave.image = imagen
        } else {
            // Si no se encuentra la imagen correspondiente, asignamos una imagen por defecto
            ImagenNave.image = UIImage(named: "imagen_por_defecto")
        }
    }
}
