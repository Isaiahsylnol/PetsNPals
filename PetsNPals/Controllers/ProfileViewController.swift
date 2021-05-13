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
    let userDefaults = UserDefaults()
    
    @IBAction func saveEditButton(_ sender: Any) {
        view.overrideUserInterfaceStyle = .dark
        super.overrideUserInterfaceStyle = .dark
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let email = userDefaults.value(forKey: "currentUser")
        let user = ModelManager.getInstance().findUser(user_email: email as! String)

        print(user)
        nameTextField.text = user[0].name
        emailTextField.text = user[0].email
        addressTextField.text = user[0].address
        phoneTextField.text = user[0].phone
        phone2TextField.text = user[0].phone2
    }
}
