//
//  ControladorPantallaDelPost.swift
//  boceto_2_CellView
//
//  Created by Jadzia Gallegos on 10/10/24.
//

import UIKit

class ControladorPantallaDelPost: UIViewController, UICollectionViewDataSource {
    
    
    let proveedor_publicaciones = ProveedorDePublicaciones.autoreferencia
    
    public var id_publicacion: Int?
    private var publicacion: publicacion?
    private var usuario: Usuario?
    
    private var lista_Comentarios: [Comentario] = []
    
    private let IdentificadorDeCelda = "celdaComentario"
    private let url_Comentarios = "https://jsonplaceholder.typicode.com/comments?postId=1"

    
    
    @IBOutlet weak var Titulo_de_publicacion: UILabel!
    @IBOutlet weak var Seccion_Comentarios: UICollectionView!
    @IBOutlet weak var Cuerpo_publicacion: UILabel!
    @IBOutlet weak var Nombre_de_usuario: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Se esta cargando para \(self.id_publicacion)")
        
        
        // Do any additional setup after loading the view.
        
        
        let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
        controlador_de_navegacion?.activar_navigation_bar(actviar: true)
        Seccion_Comentarios.dataSource = self
        
        realizar_descarga_de_informacion()
    }
    
    func realizar_descarga_de_informacion(){
        if self.publicacion == nil {
            proveedor_publicaciones.obtener_publicacion(id: self.id_publicacion ?? -1, que_hacer_al_recibir: {
                [weak self] (publicacion) in self?.publicacion = publicacion
                DispatchQueue.main.async {
                    self?.dibujar_publicacion()
                    self?.realizar_descarga_de_informacion()
                }
            })
        }
        
        else if self.publicacion != nil {
            proveedor_publicaciones.obtener_usuario(id: publicacion!.userId, que_hacer_al_recibir: {
                [weak self] (usuario) in self?.usuario = usuario
                DispatchQueue.main.async {
                    self?.dibujar_usuario()
                    
                }
            })
            proveedor_publicaciones.obtener_comentarios_en_publicacion(id: publicacion!.id, que_hacer_al_recibir: {
                [weak self] (comentarios_descargados) in self?.lista_Comentarios = comentarios_descargados
                DispatchQueue.main.async {
                    self?.Seccion_Comentarios.reloadData()
                    //print(self?.lista_Comentarios)
                }
            })
        }
    }
    
    func dibujar_publicacion(){
        guard let publicacion_actual = self.publicacion else {
            return
        }
        Titulo_de_publicacion.text = publicacion_actual.title
        Cuerpo_publicacion.text = publicacion_actual.body
        
    }
    
    func dibujar_usuario(){
        guard let usuario_actual = self.usuario else {
            return
        }
        Nombre_de_usuario.text = usuario_actual.username
    }
    
 
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Cuantos cometnarios hay \(lista_Comentarios.count)")
        return lista_Comentarios.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Aqui denberia hacer algo")
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: IdentificadorDeCelda, for: indexPath) as! VistaComentarios
        
        
        celda.NombreDelUsuario.text = self.lista_Comentarios[indexPath.item].email
        celda.CuerpoComentario.text = self.lista_Comentarios[indexPath.item].body
        
        return celda
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


