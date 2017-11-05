//
//  ViewController.swift
//  Kainan
//
//  Created by Fulltime on 15/10/2017.
//  Copyright © 2017 University of the Philippines. All rights reserved.
//

import UIKit

//added UIImagePickerDelegate on 2nd day at UPSITF

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    //MARK: PROPERTIES
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate = self
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: FUNCTIONS
    
//    @IBAction func setDefaultLabelText(_ sender: Any) {
//        nameTextField.text = ""
//        nameTextField.resignFirstResponder()
//        mealNameLabel.text = "Meal Name"
//    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {fatalError("Expected a dictionary containing a image, but was provided the following: \(info)") }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: UINavigationControllerDelegate
    
    
    
    
    //MARK: UITEXTFIELD
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }

}

