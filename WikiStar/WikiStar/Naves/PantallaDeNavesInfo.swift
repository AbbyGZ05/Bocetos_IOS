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
    
    public var id_nave: Int?
        public var nave: Naves?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Aseguramos que el controlador de navegación tiene la barra activada
            let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
            controlador_de_navegacion?.activar_navigation_bar(actviar: true)
            
            // Llamar a la función para realizar la descarga de la información
            realizar_descarga_de_informacion_naves()
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
            Eqwuipo.text = String(format: "Crew %@", nave.crew)
            Cargo.text = String(format: "%@ Tons.", nave.cargo_capacity)
            Pasajeros.text = "\(nave.passengers) people"
            VelocidadMax.text = String(format: "%@ km/h", nave.max_atmosphering_speed)
            Creditos.text = String(format: "₡ %@", nave.cost_in_credits)
            Hyper.text = String(format: "Class %@",nave.hyperdrive_rating)
            ClaseNave.text = nave.starship_class
        
    
    // Usar el diccionario de imágenes para obtener y mostrar la imagen correspondiente
    let nombreNave = nave.name
    
        if let imagen = diccionarioDeImagenesNaves[nombreNave] {
            ImagenNave.image = imagen
        } else {
            // Si no se encuentra la imagen, muestra una imagen por defecto
            ImagenNave.image = UIImage(named: "imagen_por_defecto")
        }
    }
}


