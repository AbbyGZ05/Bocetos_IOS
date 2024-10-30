//
//  ViewController.swift
//  Pueba
//
//  Created by alumno on 10/30/24.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var AquiVaLaFoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func SubirFotoParaMostrar(_ sender: Any) {
        let seleccionar_imagen = UIImagePickerController()
        seleccionar_imagen.delegate = self
        
        seleccionar_imagen.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        seleccionar_imagen.allowsEditing = false
        
        self.present(seleccionar_imagen, animated: true)
    }
    func    imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagen_selecionada = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            AquiVaLaFoto.image = imagen_selecionada
        }
        else{
                //"Hacer algo"
        }
        
        self.dismiss(animated: true)
    }
}


