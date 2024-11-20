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
    }
}
