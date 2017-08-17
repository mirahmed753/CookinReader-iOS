//
//  RecipePhotoHelper.swift
//  CookinReader
//
//  Created by Mir Ahmed on 8/11/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class RecipePhotoHelper: NSObject {
    
    var completionHandler: ((UIImage) -> Void)?
    
    // have the user choose where the to be uploaded picture should come from
    func presentActionSheet(from viewController: RecipeViewController,
                            completion: @escaping (UIImage) -> Void) {
        
        self.completionHandler = completion
        
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { [unowned self] action in
                self.presentImagePickerController(with: .camera, from: viewController)
            })
            
            alertController.addAction(capturePhotoAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { action in
                self.presentImagePickerController(with: .photoLibrary, from: viewController)
            })
            
            alertController.addAction(uploadAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        viewController.present(alertController, animated: true)
    }
    
    func presentImagePickerController(with sourceType: UIImagePickerControllerSourceType, from viewController: UIViewController) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        
        viewController.present(imagePickerController, animated: true)
    }
    
    
    // save photo with UUID
    static func savePhotoFor(recipe: Recipe, photo: UIImage)
    {
        
        do {
             let documentsURL = try FileManager.default.url(for: .documentDirectory,
                                                    in: .userDomainMask,
                                                    appropriateFor: nil,
                                                    create: false)
            
            var fullPath = documentsURL.appendingPathComponent("\(recipe.uniqueID)")
            fullPath = fullPath.appendingPathExtension(".png")
            
            let photoData = UIImagePNGRepresentation(photo)!
            
            try! photoData.write(to: fullPath)
            
        } catch _ {
            return
        }
    }
    
    
    static func loadImageFromPath(_ path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path as String)
        
        if image == nil {
            return nil
        } else {
            return image
        }
    }
    
    // get photo with UUID
    static func loadPhotoFor(recipe: Recipe) -> UIImage? {
        do {
            let documentsURL = try FileManager.default.url(for: .documentDirectory,
                                                           in: .userDomainMask,
                                                           appropriateFor: nil,
                                                           create: false)
            
            var fullPath = documentsURL.appendingPathComponent("\(recipe.uniqueID)")
            fullPath = fullPath.appendingPathExtension(".png")
            
            return loadImageFromPath(fullPath.path)
            
        } catch _ {
            return nil
        }
        
        return nil
    }
}

extension RecipePhotoHelper: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            completionHandler?(selectedImage)
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
