//
//  controladorPantallaPrincipalDeColeccion.swift
//  Boceto_02
//
//  Created by alumno on 10/7/24.
//

import UIKit



class controladorPantallaPrincipalDeColeccion: UICollectionViewController {
    
    private var lista_de_especies: [Especies] = []
    
    private let IdentificadorDeCelda = "PantallaDeEspeciesLista"
    private let url_api = "https://swapi.dev/api/species/"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //Registrar la celda
              //collectionView.register(VistaDeCeldaEspecies.self, forCellWithReuseIdentifier: IdentificadorDeCelda)
                
                // Obtener datos
        
        /*let ubicacion = URL(string: url_api)!
        URLSession.shared.dataTask(with: ubicacion) { (datos, respuesta, error) in
            do {
                if let especies_recibidas = datos {
                    // Decodificar la respuesta completa
                    let respuestaDecodificada = try JSONDecoder().decode(EspeciesRespuesta.self, from: especies_recibidas)
                    
                    // Obtener el arreglo de especies desde la clave `results`
                    self.lista_de_especies = respuestaDecodificada.results
                    
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
                else {
                    print(respuesta)
                }
            } catch {
                print("Error :c \(error)")
            }
        }.resume()

         */
        
        proveedorDeInfromacion.autoreferencia
            .obtener_especies(que_hacer_al_recibir: {[weak self] (esepcies_descargads) in
                self?.lista_de_especies = esepcies_descargads
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
                print(esepcies_descargads)})
        
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
        return self.lista_de_especies.count
    }
    
    //funcion para identificar y crear cada una de las  celdas en el controlaodr
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda: VistaDeCeldaEspecies = collectionView.dequeueReusableCell(withReuseIdentifier: IdentificadorDeCelda, for: indexPath) as! VistaDeCeldaEspecies
        
        
        celda.etiqueta.text = self.lista_de_especies[indexPath.item].name
        
        
        return celda
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Se selecciono la celda\(indexPath)")

                
                //print(self.navigationController)
        
        if let pantalla_de_especie = storyboard?.instantiateViewController(withIdentifier: "PantallaDeEspeciesInfo") as? ControladorPantallaInfoEspecie {
            // Asegúrate de que 'id_especie' no sea nil
            pantalla_de_especie.id_especie = indexPath.item
            self.navigationController?.pushViewController(pantalla_de_especie, animated: true)
        } else {
            print("No se pudo encontrar el controlador de vista con el identificador 'PantallaDeEspecieInfo'")
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
    

