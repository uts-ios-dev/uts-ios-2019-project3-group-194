//
//  SelfieViewController.swift
//  WerewolfGame
//
//  Created by Anzi Wu on 27/5/19.
//  Copyright © 2019 King. All rights reserved.
//

import Foundation
import UIKit

class SelfieViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var PlayerSelfie: UIImageView!
    
    
    @IBAction func TakeASelfie(_ sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            let imagePicker = UIImagePickerController();
            imagePicker.delegate = self;
            imagePicker.sourceType = UIImagePickerController.SourceType.camera;
            imagePicker.allowsEditing = false;
            self.present(imagePicker,animated:true,completion:nil);
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            PlayerSelfie.contentMode = .scaleToFill;
            PlayerSelfie.image = pickedImage;
            //save image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DrawACard(_ sender: UIButton)
    {
        if PlayerSelfie.image == nil
        {
            //Animation
        }
        else
        {
            performSegue(withIdentifier: "toCardView", sender: DrawACard);
        }
    }
}
