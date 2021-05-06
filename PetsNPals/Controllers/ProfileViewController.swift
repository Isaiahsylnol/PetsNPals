//
//  ProfileViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-29.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phone2TextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    let user = ModelManager.getInstance().findUser(user_id: 1)
    @IBAction func saveEditButton(_ sender: Any) {
        view.overrideUserInterfaceStyle = .dark
        super.overrideUserInterfaceStyle = .dark
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(user[0].username)
        print(user)
        nameTextField.text = user[0].name
        emailTextField.text = user[0].email
        addressTextField.text = user[0].address
        phoneTextField.text = user[0].phone
        phone2TextField.text = user[0].phone2
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
