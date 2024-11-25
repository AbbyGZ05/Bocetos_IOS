


//
//  controladorPantallaPrincipalDeColeccion.swift
//  Boceto_02
//
//  Created by alumno on 10/7/24.
//

import UIKit



// Clase que maneja la pantalla de vehículos con una colección de elementos
class VehiculosControladorDePantalla: UICollectionViewController {
    
    // Propiedad para almacenar la lista de vehículos descargados
    private var lista_de_vehiculos: [Vehiculos] = []
    
    // Identificador de la celda para la colección
    private let IdentificadorDeCeldaVehiculos = "PantallaDeVehiculosLista"
    // URL de la API para obtener los vehículos
    private let url_api = "https://swapi.dev/api/vehicles/"
    
    // Método que se llama cuando la vista está lista para ser cargada
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Llama al proveedor de información de vehículos para descargar los vehículos
        ProveedorInfoVehiculos.autoreferencia
            .obtener_vehiculos(que_hacer_al_recibir: {[weak self] (vehiculos_descargados) in
                self?.lista_de_vehiculos = vehiculos_descargados  // Guarda los vehículos descargados
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()  // Recarga la vista de la colección
                }
            })
        
        // Personaliza la barra de navegación: color de fondo negro y texto blanco
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Crea un botón de retroceso con una imagen personalizada
        let backButton = UIBarButtonItem(
            image: UIImage(named: "BotonBack"),  // Imagen del botón de retroceso
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)  // Acción al presionar el botón
        )
        
        // Ajusta la posición de la imagen del botón
        backButton.imageInsets = UIEdgeInsets(top: 0, left: -130, bottom: 0, right: 0)
        
        // Asigna el botón de retroceso a la barra de navegación
        navigationItem.leftBarButtonItem = backButton
        
        // Crea un botón "More" en la barra de navegación
        let moreButton = UIBarButtonItem(
            title: "More >",  // Título del botón
            style: .plain,
            target: self,
            action: #selector(moreButtonTapped)  // Acción al presionar el botón
        )
        
        // Establece los botones "More" y "Back" en la barra de navegación
        navigationItem.rightBarButtonItems = [moreButton, backButton]
    }
    
    // Acción del botón de retroceso
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)  // Vuelve a la pantalla anterior
    }
    
    // Acción del botón "More" que navega a una pantalla adicional
    @objc func moreButtonTapped() {
        if let moreScreen = storyboard?.instantiateViewController(withIdentifier: "More") {
            // Si existe la pantalla "More", navega hacia ella
            self.navigationController?.pushViewController(moreScreen, animated: true)
        }
    }

    // MARK: UICollectionViewDataSource
    
    // Número de secciones en la colección (solo una sección en este caso)
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Número de elementos en la sección
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.lista_de_vehiculos.count  // Devuelve el número de vehículos descargados
    }
    
    // Configura cada celda en la colección con la información del vehículo
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda: VistaDeCeldaVehiculos = collectionView.dequeueReusableCell(withReuseIdentifier: IdentificadorDeCeldaVehiculos, for: indexPath) as! VistaDeCeldaVehiculos
        celda.etiquetaVehiculos.text = self.lista_de_vehiculos[indexPath.item].name  // Muestra el nombre del vehículo
        return celda
    }
    
    // Acción cuando se selecciona un elemento de la colección
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Se selecciono la celda\(indexPath)")
        
        // Instancia el controlador de detalles del vehículo y pasa el ID del vehículo seleccionado
        if let pantalla_de_vehiculos = storyboard?.instantiateViewController(withIdentifier: "PantallaVehiculosInfo") as? PantallaVehiculosInfo {
            pantalla_de_vehiculos.id_vehiculo = indexPath.item  // Establece el ID del vehículo
            self.navigationController?.pushViewController(pantalla_de_vehiculos, animated: true)  // Navega hacia la pantalla de detalles del vehículo
        } else {
            print("No se pudo encontrar el controlador de vista con el identificador 'PantallaDeVehiculosInfo'")
        }
    }
}
