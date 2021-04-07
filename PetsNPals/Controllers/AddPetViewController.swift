//
//  AddPetViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-21.
//

import UIKit
import SQLite3

class AddPetViewController: UIViewController, UITextViewDelegate {
    var db:DBHelper = DBHelper()
    
    var viewModel: NewDogViewModel!
    
    var pets:[Dog] = []

    @IBOutlet weak var petNameTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    
    @IBOutlet weak var petGenderTextField: UITextField!
    @IBOutlet weak var petAgeTextField: UITextField!
    @IBOutlet weak var petWeightTextField: UITextField!
    @IBOutlet weak var petHeightTextField: UITextField!
    @IBOutlet weak var commentsTextView: UITextView!
    
    @IBAction func saveButton(_ sender: Any) {
        let names = (petNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let breeds = (breedTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let genders = (petGenderTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let age = Int((petAgeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)!
        let weight = Int((petWeightTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)!
        let height = Int((petHeightTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)!
        let comments = (commentsTextView.text?.trimmingCharacters(in: .whitespacesAndNewlines))!

        // Create new dog
        let dogValues = Dog(id: 0, age: age, name: names, gender: genders, breed: breeds, weight: weight, height: height, comment: comments)
        createNewPet(dogValues)
    
        SQLiteCommands.presentRows()
       
        self.dismiss(animated: true, completion: nil)
    }
    
    // Array of breeds
    let breeds = ["Huskey","Labador","Poodle","Frenchie","Doberman","Boxer","Pitbull"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
    
        commentsTextView?.text = "Enter comments"
        commentsTextView?.textColor = UIColor.lightGray
        commentsTextView?.returnKeyType = .done
        commentsTextView?.delegate = self
        commentsTextView?.layer.borderWidth = 1
        commentsTextView?.layer.borderColor = UIColor.lightGray.cgColor
 
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        
        breedTextField?.inputView = pickerView
     
        print("Everything is fine with database")
    }
    
    private func createTable() {
        let database = SQLiteDatabase.sharedInstance
        database.createTable()
    }
    
    private func createNewPet(_ dogValues:Dog) {
        let dogAddedToTable = SQLiteCommands.insertRow(dogValues)
        
        if dogAddedToTable == true {
            dismiss(animated: true, completion: nil)
        } else {
            print("Error:   This dog cannot be created")
        }
    }
    
    private func createNewProduct(_ prodValues:Product) {
        let prodAddedToTable = SQLiteCommands.insertProductRow(prodValues)
        
        if prodAddedToTable == true {
            dismiss(animated: true, completion: nil)
        } else {
            print("Error:   This product cannot be created")
        }
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
