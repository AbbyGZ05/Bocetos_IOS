import UIKit

class ControladorPantallaInfoEspecie: UIViewController, UICollectionViewDataSource {
    
    private let identificador_de_celda = "PantallaDeEspeciesInfo"
    
    let proveedor_De_Informacion = proveedorDeInfromacion.autoreferencia  // Proveedor de información

    @IBOutlet weak var Seccion_Especies: UICollectionView!

    
    public var id_especie: Int?
    public var especie: Especies?
    
    private var lista_de_Especies: [Especies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Aseguramos que el controlador de navegación tiene la barra activada
        let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
        controlador_de_navegacion?.activar_navigation_bar(actviar: true)
        
        // Establecer el dataSource de la colección
        Seccion_Especies.dataSource = self
        
        // Llamar a la función para realizar la descarga de la información
        realizar_descarga_de_informacion()
    }
    
    // Método para obtener la información de la especie
    func realizar_descarga_de_informacion() {
        if self.especie == nil {
            proveedor_De_Informacion.obtener_especie(id: self.id_especie ?? -1, que_hacer_al_recibir: { [weak self] (especies) in
                self?.especie = especies
                DispatchQueue.main.async {
                    self?.realizar_descarga_de_informacion()  // Llamar nuevamente si es necesario
                }
            })
        }
    }
    


    
    // MARK: - UICollectionViewDataSource
    
    // Número de elementos en la sección
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lista_de_Especies.count
    }
    
    // Configuración de las celdas
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: identificador_de_celda, for: indexPath) as! VistaInfoEspecies
        
        // Obtener la especie correspondiente
        let especieActual = lista_de_Especies[indexPath.item]
        
        // Configurar la celda con la información de la especie
        celda.Nombre.text = especieActual.name
        celda.Altura.text = String(format: "%@ cm", especieActual.average_height)  // Convertir a String
        celda.Vida.text = String(format: "%@ años", especieActual.average_lifespan)  // Convertir a String
        celda.Lenguaje.text = especieActual.language
        celda.Origen.text = especieActual.homeworld
        
        return celda
    }
}

