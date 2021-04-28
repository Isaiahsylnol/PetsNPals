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
        if editingStyle == .delete {
            petTableView.beginUpdates()
            pets.remove(at: indexPath.row)
            petTableView.deleteRows(at: [indexPath], with: .fade)
            petTableView.endUpdates()
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
        cell.editPetButton.tag = indexPath.row
        cell.deletePetButton.tag = indexPath.row
        cell.editPetButton.addTarget(self, action: #selector(onClickEdit), for: .touchUpInside)
        cell.deletePetButton.addTarget(self, action: #selector(onClickEdit), for: .touchUpInside)
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
