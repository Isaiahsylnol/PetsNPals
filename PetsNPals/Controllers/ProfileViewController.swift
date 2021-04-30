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
    
    var users = [UserModel]()
    let user = ModelManager.getInstance().getAllUsers()
    @IBAction func saveEditButton(_ sender: Any) {
        view.overrideUserInterfaceStyle = .dark
        super.overrideUserInterfaceStyle = .dark
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(user[0].username)
        nameTextField.text = user[0].username

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
