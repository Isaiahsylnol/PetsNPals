//
//  ManagePetViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-06.
//

import UIKit

class ManagePetViewController: UIViewController {

    @IBOutlet weak var petTableView: UITableView!
    var pets = [DogModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var editPetButton: UIButton!
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Sliding delete functionality 
        if editingStyle == .delete {
            let actionSheet = UIAlertController(title: "",
                                                message: "Are you sure you want delete this pet?",
                                                preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Cancel",
                                                style: .cancel, handler: nil))
            actionSheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [self]_ in
                
                petTableView.beginUpdates()
                let isDeleted = ModelManager.getInstance().deletePet(dog: pets[indexPath.row])
                pets.remove(at: indexPath.row)
                petTableView.deleteRows(at: [indexPath], with: .fade)
                petTableView.endUpdates()
                petTableView.reloadData()
                print("isDelete: \(isDeleted)")
            }))
            self.present(actionSheet, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pets = ModelManager.getInstance().getAllPets()
        petTableView?.reloadData()
    }
}

extension ManagePetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetTableViewCell", for: indexPath) as! PetTableViewCell
        cell.nameLabel.text = pets[indexPath.row].name
        cell.breedLabel.text = "Breed: \(pets[indexPath.row].breed)"
        cell.weightLabel.text = "Weight: \(pets[indexPath.row].weight)"
        cell.heightLabel.text = "Height: \(pets[indexPath.row].height)"
        cell.ageLabel.text = "Age: \(pets[indexPath.row].age)"
        cell.genderLabel.text = "Gender: \(pets[indexPath.row].gender)"
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    @objc func onClickEdit(_ sender: UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "AddPetViewController") as! AddPetViewController
        vc.petData = pets[sender.tag]
        vc.headerTitle = "update"
        navigationController?.pushViewController(vc, animated: true)
    }
}
