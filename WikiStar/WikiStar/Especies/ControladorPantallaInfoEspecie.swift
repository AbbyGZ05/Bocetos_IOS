import UIKit

class ControladorPantallaInfoEspecie: UIViewController {
    
    // Diccionario de imágenes, mapeando el nombre de la especie a una imagen
    let diccionarioDeImagenes: [String: UIImage] = [
        "Human": UIImage(named: "Humanos.png")!,
        "Droid": UIImage(named: "Droide.png")!,
        "Wookie": UIImage(named: "Chuvaca.png")!,
        "Rodian": UIImage(named: "Rodian.png")!,
        "Hutt": UIImage(named: "Hutt.png")!,
        "Yoda's species": UIImage(named: "babyyoda.png")!,
        "Trandoshan": UIImage(named: "Tandoshan.png")!,
        "Mon Calamari": UIImage(named: "Calamari.png")!,
        "Ewok": UIImage(named: "ewok.png")!,
        "Sullustan": UIImage(named: "Sullstan.png")!,
        
    ]
    
    let proveedor_De_Informacion = proveedorDeInfromacion.autoreferencia  // Proveedor de información

    @IBOutlet weak var Nombre: UILabel!
    @IBOutlet weak var Altura: UILabel!
    @IBOutlet weak var vida: UILabel!
    @IBOutlet weak var Lenguaje: UILabel!
    @IBOutlet weak var Origen: UILabel!
    @IBOutlet weak var imagenEspecie: UIImageView!
    
    public var id_especie: Int?
    public var especie: Especies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Aseguramos que el controlador de navegación tiene la barra activada
        let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
        controlador_de_navegacion?.activar_navigation_bar(actviar: true)
        
        // Llamar a la función para realizar la descarga de la información
        realizar_descarga_de_informacion()
        
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
    func realizar_descarga_de_informacion() {
        if self.especie == nil {
            proveedor_De_Informacion.obtener_especie(id: self.id_especie ?? -1, que_hacer_al_recibir: { [weak self] (especies) in
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
        vida.text = String(format: "%@ years", especie.average_lifespan)
        Lenguaje.text = especie.language
        
        // Llamar a la función para obtener el nombre del planeta (homeworld)
        if let homeworldURL = especie.homeworld {
            obtenerNombrePlaneta(from: homeworldURL) { [weak self] nombrePlaneta in
                DispatchQueue.main.async {
                    self?.Origen.text = nombrePlaneta
                }
            }
        }
        
        // Usar el diccionario de imágenes para obtener y mostrar la imagen correspondiente
        let nombreEspecie = especie.name
        
            if let imagen = diccionarioDeImagenes[nombreEspecie] {
                imagenEspecie.image = imagen
            } else {
                // Si no se encuentra la imagen, muestra una imagen por defecto
                imagenEspecie.image = UIImage(named: "imagen_por_defecto")
            }
    }
    
    // Función para obtener el nombre del planeta desde la URL de homeworld
    func obtenerNombrePlaneta(from url: String, completion: @escaping (String) -> Void) {
        guard let url = URL(string: url) else {
            completion("Desconocido")
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error al obtener el planeta: \(error)")
                completion("Desconocido")
                return
            }
            
            guard let data = data else {
                completion("Desconocido")
                return
            }
            
            do {
                // Aquí asumimos que la respuesta de la API es un diccionario con una clave "name"
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let nombrePlaneta = jsonResponse["name"] as? String {
                    completion(nombrePlaneta)
                } else {
                    completion("Desconocido")
                }
            } catch {
                print("Error al parsear la respuesta del planeta: \(error)")
                completion("Desconocido")
            }
        }
        
        task.resume()
    }
}

