import UIKit

class PantallaDePlanetasInfo: UIViewController{
    
    // Diccionario de imágenes, mapeando el nombre de la especie a una imagen
    let diccionarioDeImagenesPlanetas: [String: UIImage] = [
        "Tatooine": UIImage(named: "Tatooine.png")!,
        "Alderaan": UIImage(named: "Alderaan.png")!,
        "Yavin IV": UIImage(named: "YavinIV.png")!,
        "Hoth": UIImage(named: "Hoth.png")!,
        "Bespin": UIImage(named: "Bespin.png")!,
        "Endor": UIImage(named: "Endor.png")!,
        "Naboo": UIImage(named: "Naboo.png")!,
        "Coruscant": UIImage(named: "Coruscant.png")!,
        "Kamino": UIImage(named: "Kamino.png")!,
        "Dagobah": UIImage(named: "Dagobah.png")!,
        
    ]
    
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
    @IBOutlet weak var ImagenPlaneta: UIImageView!
    
    public var id_planeta: Int?
    public var planeta: Planetas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ensure the navigation controller has the bar activated
        let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
        controlador_de_navegacion?.activar_navigation_bar(actviar: true)
        
        // Ensure the planet ID is valid before attempting to download the data
        guard let id_planeta = id_planeta, id_planeta < proveedor_De_Informacion_Planeta.lista_de_planetas.count else {
            // Handle invalid ID (could show an error or return early)
            return
        }
        
        // Call the function to fetch and update the planet's info
        realizar_descarga_de_informacion_planetas()
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
    
    func realizar_descarga_de_informacion_planetas() {
        print("-----en funcion\(#function) ")
        
        guard let id_planeta = id_planeta else { return }
        let planetaData = proveedor_De_Informacion_Planeta.lista_de_planetas[id_planeta]
        
        // Assuming 'planeta' is assigned from the data source:
        self.planeta = planetaData
        actualizarEtiquetas()
    }
    
    func actualizarEtiquetas() {
        print("------Estamos en \(#function)")
        guard let planeta = self.planeta else { return }
        
        // Assign values to the labels
        Nombre.text = planeta.name
        Rotacion.text = String(format: "%@ hours", planeta.rotation_period)
        Orbita.text = String(format: "%@ days", planeta.orbital_period)
        Diametro.text = String(format: "%@ km", planeta.diameter)
        Clima.text = planeta.climate
        Gravedad.text = planeta.gravity
        Terreno.text = planeta.terrain
        AWA.text = String(format: "%@%%", planeta.surface_water)
        Poblacion.text = String(format: "%@", planeta.population)
        
    // Usar el diccionario de imágenes para obtener y mostrar la imagen correspondiente
    let nombrePlaneta = planeta.name
    
        if let imagen = diccionarioDeImagenesPlanetas[nombrePlaneta] {
            ImagenPlaneta.image = imagen
        } else {
            // Si no se encuentra la imagen, muestra una imagen por defecto
            ImagenPlaneta.image = UIImage(named: "imagen_por_defecto")
        }
    }
}
