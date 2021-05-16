//
//  NewProductViewController.swift
//  Wishlist
//
//  Created by Nadia Vedeneyeva on 5/14/21.
//

import UIKit
import CoreData

class NewProductViewController:
    UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var storeTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    //public var isDismissed: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))

        self.imageView.addGestureRecognizer(imageTapRecognizer)


    }
//
//    @objc func imageTapped () {
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
//            let cameraViewConter = UIImagePickerController()
//            cameraViewConter.sourceType = UIImagePickerController.SourceType.camera
//            cameraViewConter.delegate = self
//
//            self.present(cameraViewConter, animated: true, completion: nil)
//        }
//    }
    
    @IBAction func imageTapped () {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, info:  [UIImagePickerController.InfoKey : Any]) {
//        self.imageView.image = image
//
//        picker.dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func saveTapped(_ sender: Any) {
        let context = UIApplication.shared.delegate as! AppDelegate
        let contextObject = context.persistentContainer.viewContext
        
        let product = NSEntityDescription.insertNewObject(forEntityName: "Product", into: contextObject) as! Product
        
        product.title = titleTextField.text
        product.store = storeTextField.text
        product.image = self.imageView!.image!.pngData()
        
        do {
            try contextObject.save()
            print("saved")
        }catch _ {
        }
        
//        let mainViewController = ViewController()
//        self.dismiss(animated: true, completion: {
//            mainViewController.viewWillAppear(true)
//        })
        
        //self.isDismissed?()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTApped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
