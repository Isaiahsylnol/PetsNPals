//
//  ProfileViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-29.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phone2TextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBAction func saveEditButton(_ sender: Any) {
        view.overrideUserInterfaceStyle = .dark
        super.overrideUserInterfaceStyle = .dark
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
 
    }
}
