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
        cell.commentsLabel.text = "Note: \(pets[indexPath.row].comment)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}
