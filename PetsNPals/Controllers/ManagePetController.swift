//
//  ManagePetController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-20.
//

import Foundation
import SwiftUI
import SQLite3

class PetTableViewCell: UITableViewCell {
    
    static let identifier = "PetTableViewCell"
 
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    func setCellWithValuesOf(_ dog: Dog) {
        petNameLabel.text = dog.name
        breedLabel.text = "Breed: \(dog.breed)"
        genderLabel.text = "Gender: \(dog.gender)"
        ageLabel.text = "Age: \(String(dog.age))"
        heightLabel.text = "Height: \(String(dog.height))"
        commentsLabel.text = "Comments: \(dog.comment)"
        weightLabel.text = "Weight: \(String(dog.weight))"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class ManagePetController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var petTable: UITableView!
    private var viewModel = ManagePetViewModel()
    
    let cellReuseIdentifier = "cell"
    
    var db:DBHelper = DBHelper()
    
    var pets:[Dog] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        pets = db.read()
        viewModel.connectToDatabase()
 
        petTable?.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        petTable?.delegate = self
        petTable?.dataSource = self
        
//        db.insert(id: 1, age: 8, name: "Bill", gender: "male", breed: "Huskey", weight: 174, height: 27, comments: "Worse boy")
//        db.insert(id: 2, age: 3, name: "Shane", gender: "male", breed: "Great Dane", weight: 44, height: 24, comments: "Good boy")
//        db.insert(id: 3, age: 2, name: "Max", gender: "female", breed: "Weiner", weight: 14, height: 8, comments: "Good boy")
//        db.insert(id: 4, age: 6, name: "Riley", gender: "male", breed: "Shiba", weight: 84, height: 28, comments: "Good boy")
    }
    
    private func loadData() {
        viewModel.loadDataFromSQLiteDatabase()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetTableViewCell", for: indexPath)
        let object = viewModel.cellForRowAt(indexPath: indexPath)
        
        if let petCell = cell as? PetTableViewCell {
            petCell.setCellWithValuesOf(object)
        }
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

