//
//  controladorPantallaPrincipalDeColeccion.swift
//  Boceto_02
//
//  Created by alumno on 10/7/24.
//

import UIKit

// Controlador para la pantalla principal de la colección de naves espaciales.
class NavesControladorPantalla: UICollectionViewController {
    
    // Array que almacenará las naves descargadas desde la API
    private var lista_de_naves: [Naves] = []
    
    // Identificador de la celda que se usará en el UICollectionView
    private let IdentificadorDeCeldaNave = "PantallaDeNavesLista"
    
    // URL base de la API para obtener los datos de las naves
    private let url_api = "https://swapi.dev/api/starships/"
    
    // Este método se llama cuando la vista está completamente cargada
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Llamada para obtener las naves desde la API
        ProveedorInfoNaves.autoreferencia
            .obtener_naves(que_hacer_al_recibir: {[weak self] (naves_descargadas) in
                // Guardar las naves descargadas en el array
                self?.lista_de_naves = naves_descargadas
                
                // Recargar la colección en el hilo principal
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            })
        
        // Personalización de la barra de navegación
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Crear el botón de retroceso con una imagen personalizada
        let backButton = UIBarButtonItem(
            image: UIImage(named: "BotonBack"), // Imagen del botón de retroceso
            style: .plain,
            target: self,
            action: #selector(backButtonTapped) // Acción al hacer clic
        )
        
        // Ajustamos el tamaño del botón de retroceso
        backButton.imageInsets = UIEdgeInsets(top: 0, left: -130, bottom: 0, right: 0) // Ajustar según sea necesario
        
        // Establecer el botón de retroceso en la barra de navegación
        navigationItem.leftBarButtonItem = backButton
        
        // Crear un botón 'More' en el lado derecho
        let moreButton = UIBarButtonItem(
            title: "More >",
            style: .plain,
            target: self,
            action: #selector(moreButtonTapped) // Acción al hacer clic
        )
        
        // Establecer el botón 'More' en la barra de navegación
        navigationItem.rightBarButtonItems = [moreButton, backButton]  // Añadir 'More' antes de 'Back'
    }
    
    // Acción del botón de retroceso
    @objc func backButtonTapped() {
        // Volver a la pantalla anterior
        navigationController?.popViewController(animated: true)
    }
    
    // Acción para el botón 'More'
    @objc func moreButtonTapped() {
        // Navegar a la pantalla 'More', si tienes un controlador con ese identificador
        if let moreScreen = storyboard?.instantiateViewController(withIdentifier: "More") {
            // Navegar a la pantalla 'More'
            self.navigationController?.pushViewController(moreScreen, animated: true)
        }
    }

    // MARK: - Métodos de UICollectionViewDataSource
    
    // Definir el número de secciones (en este caso solo una sección)
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Definir el número de elementos en la sección (el número de naves)
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.lista_de_naves.count
    }
    
    // Configuración de cada celda para mostrar la información de cada nave
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Dequeue la celda reutilizable
        let celda: VistaDeCeldaNaves = collectionView.dequeueReusableCell(withReuseIdentifier: IdentificadorDeCeldaNave, for: indexPath) as! VistaDeCeldaNaves
        
        // Asignar el nombre de la nave a la celda
        celda.etiquetaNaves.text = self.lista_de_naves[indexPath.item].name
        print(self.lista_de_naves[indexPath.item].name)
        
        return celda
    }
    
    // Acción cuando una celda es seleccionada
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Se seleccionó la celda \(indexPath)")
        
        // Instanciar el controlador de vista para mostrar la información de la nave seleccionada
        if let pantalla_de_naves = storyboard?.instantiateViewController(withIdentifier: "PantallaDeNavesInfo") as? PantallaDeNavesInfo {
            // Pasar el id de la nave seleccionada a la siguiente pantalla
            pantalla_de_naves.id_nave = indexPath.item  // O usa el valor adecuado para la nave
            self.navigationController?.pushViewController(pantalla_de_naves, animated: true)
        } else {
            print("No se pudo encontrar el controlador de vista con el identificador 'PantallaDeNavesInfo'")
        }
    }
    
    // MARK: - Métodos opcionales de UICollectionViewDelegate
    
    /*
    // Descomenta este método si deseas especificar si un ítem debe ser resaltado durante el seguimiento
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    
    /*
    // Descomenta este método si deseas especificar si un ítem debe ser seleccionado
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    
    /*
    // Descomenta estos métodos si deseas especificar si se debe mostrar un menú de acciones para el ítem
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }
    
    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    }
    */
}

