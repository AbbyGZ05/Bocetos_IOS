//
//  controladorPantallaPrincipalDeColeccion.swift
//  Boceto_02
//
//  Created by alumno on 10/7/24.
//

import UIKit



class controladorPantallaPrincipalDeColeccion: UICollectionViewController {
    private var lista_de_publicaciones: [publicacion] = []
    
    private let IdentificadorDeCelda = "celda_pantalla_principal"
    private let url_publicacion = "https://jsonplaceholder.typicode.com/posts"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Registrar la celda
              // collectionView.register(vistaDeCelda.self, forCellWithReuseIdentifier: IdentificadorDeCelda)
                
                // Obtener datos
        
        let ubicacion = URL(string: url_publicacion)!
        URLSession.shared.dataTask(with: ubicacion){(datos, respuesta, error) in do {
            if let publicaciones_recibidas = datos{
                let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([publicacion].self, from: publicaciones_recibidas)
           
                    self.lista_de_publicaciones = prueba_de_interpretacion_de_datos
                DispatchQueue.main.async{
                    self.collectionView.reloadData()
                }
            }
            else{
                print(respuesta)
            }
        }
            catch{
                print("Error \(error):v")
            }
            
        }.resume()
        
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
        return self.lista_de_publicaciones.count
    }
    
    //funcion para identificar y crear cada una de las  celdas en el controlaodr
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda: vistaDeCelda = collectionView.dequeueReusableCell(withReuseIdentifier: IdentificadorDeCelda, for: indexPath) as! vistaDeCelda
        
        // Asegúrate de que la celda no sea nil
            //let publicacion = lista_de_publicaciones[indexPath.item]
            //celda.etiqueta.text = "\(indexPath)"
        celda.etiqueta.text = self.lista_de_publicaciones[indexPath.item].title
        celda.cuerpo.text = self.lista_de_publicaciones[indexPath.item].body
        // Configure the cell
        //celda.etiqueta.text  = "\(indexPath)"
        
        return celda
    }
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("Se selecciono la celda\(indexPath)")
                
                let pantalla_de_publicacion = storyboard?.instantiateViewController(withIdentifier: "PantallaPublicacion") as! ControladorPantallaDelPost
                
                // pantalla_de_publicacion.id_publicacion = indexPath.item
                pantalla_de_publicacion.id_publicacion = self.lista_de_publicaciones[indexPath.item].id
                
                self.navigationController?.pushViewController(pantalla_de_publicacion, animated: true)
                
                //print(self.navigationController)
    }
    
  /*  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Se seleciono la celda \(indexPath)")
        
        let pantalla_de_publicacion = storyboard?.instantiateViewController(withIdentifier: "PantallaPublicacion") as! ControladorPantallaDelPost
                
                self.navigationController?.pushViewController(pantalla_de_publicacion, animated: true)
                
                print(self.navigationController)
    }*/
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
    
}
