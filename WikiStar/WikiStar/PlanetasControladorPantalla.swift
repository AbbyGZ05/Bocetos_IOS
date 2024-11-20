

//
//  controladorPantallaPrincipalDeColeccion.swift
//  Boceto_02
//
//  Created by alumno on 10/7/24.
//

import UIKit



class PlanatasControladorPantalla: UICollectionViewController {
    
    private var lista_de_planetas: [Planetas] = []
    
    private let IdentificadorDeCeldaPlaneta = "PantallaDePlanetasLista"
    private let url_api = "https://swapi.dev/api/planets/"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        ProveedorInfoPlanetas.autoreferencia
            .obtener_planetas(que_hacer_al_recibir: {[weak self] (planetas_descargados) in
                self?.lista_de_planetas = planetas_descargados
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            })
        
        

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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //Imprime el simeroo de secciones que haya en la lista
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.lista_de_planetas.count
    }
    
    //funcion para identificar y crear cada una de las  celdas en el controlaodr
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda: VistaDeCeldaPlanetas = collectionView.dequeueReusableCell(withReuseIdentifier: IdentificadorDeCeldaPlaneta, for: indexPath) as! VistaDeCeldaPlanetas
        

        //celda.etiquetaPlaneta.text = self.lista_de_planetas[indexPath.item].name
        celda.etiquetaPlaneta.text = self.lista_de_planetas[indexPath.item].name
        
        print(self.lista_de_planetas[indexPath.item].name)


        
        
        return celda
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Se selecciono la celda\(indexPath)")

                
                //print(self.navigationController)
        
        if let pantalla_de_planetas = storyboard?.instantiateViewController(withIdentifier: "PantallaDePlanetasInfo") as? PantallaDePlanetasInfo{
            // Asegúrate de que 'id_especie' se pase correctamente
            // Si tienes un array o una lista de especies, deberías pasar el 'id' correcto
            // Aquí asumo que 'indexPath.item' es el índice de un arreglo de especies, si es necesario
            pantalla_de_planetas.id_planeta = indexPath.item // O usa el valor de especie adecuado
            self.navigationController?.pushViewController(pantalla_de_planetas, animated: true)
        } else {
            print("No se pudo encontrar el controlador de vista con el identificador 'PantallaDeplanetaInfo'")
        }

    }
    
 /* override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Se seleciono la celda \(indexPath)")
        
        let Pantalla_Info_Especie = storyboard?.instantiateViewController(withIdentifier: "PantallaDeEspeciesInfo") as! ControladorPantallaInfoEspecie
                
                self.navigationController?.pushViewController(Pantalla_Info_Especie, animated: true)
                
                print(self.navigationController)*/
    }
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    

