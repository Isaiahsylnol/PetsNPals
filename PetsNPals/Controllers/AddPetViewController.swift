//
//  AddPetViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-21.
//

import UIKit
import SQLite3

class AddPetViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var petNameTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    
    @IBOutlet weak var petGenderTextField: UITextField!
    @IBOutlet weak var petAgeTextField: UITextField!
    @IBOutlet weak var petWeightTextField: UITextField!
    @IBOutlet weak var petHeightTextField: UITextField!
    @IBOutlet weak var commentsTextView: UITextView!
    
    var headerTitle = ""
    var petData: DogModel?
    
    @IBAction func saveButton(_ sender: Any) {
        // Create new dog
        if headerTitle != ""{
            let pet = DogModel(  id: petData!.id, age: Int(petAgeTextField.text!)!, name: petNameTextField.text!, gender: petGenderTextField.text!, breed: breedTextField.text!, weight: Double(petWeightTextField.text!)!, height: Double(petHeightTextField.text!)!, comment: commentsTextView.text!)
            let isUpdate = ModelManager.getInstance().updatePet(pet: pet)
            
            print("isUpdate: - \(isUpdate)")
            
            _ = navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
        else {
            let pet = DogModel(id: 0, age: Int(petAgeTextField.text!)!, name: petNameTextField.text!, gender: petGenderTextField.text!, breed: breedTextField.text!, weight: Double(petWeightTextField.text!)!, height: Double(petHeightTextField.text!)!, comment: commentsTextView.text)
            
            let isSave = ModelManager.getInstance().SavePet(pet: pet)
            print("isSve: -\(isSave)")
            
            _ = navigationController?.popViewController(animated: true)
           // createNewPet(dogValues)
           
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // Array of breeds
    let breeds = ["Huskey","Labador","Poodle","Frenchie","Doberman","Boxer","Pitbull"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if headerTitle != ""{
            self.title = headerTitle
            petNameTextField.text = petData?.name
            petGenderTextField.text = petData?.gender
            petWeightTextField.text = String(petData!.weight)
            petHeightTextField.text = String(petData!.height)
            breedTextField.text = petData?.breed
            petAgeTextField.text = String(petData!.age)
            commentsTextView.text = petData!.comment
        }
    
        commentsTextView?.text = "Enter comments"
        commentsTextView?.textColor = UIColor.lightGray
        commentsTextView?.returnKeyType = .done
        commentsTextView?.delegate = self
        commentsTextView?.layer.borderWidth = 1
        commentsTextView?.layer.borderColor = UIColor.lightGray.cgColor
 
        pickerView.delegate = self
        pickerView.dataSource = self
        
        breedTextField?.inputView = pickerView
     
        print("Everything is fine with database")
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Enter comments" {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Enter comments"
            textView.textColor = UIColor.lightGray
        }
    }
}

extension AddPetViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return breeds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return breeds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        breedTextField.text = breeds[row]
        breedTextField.resignFirstResponder()
    }
}
