//
//  ViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-19.
//

import UIKit
import SQLite3

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var db: OpaquePointer?
    
    @IBOutlet weak var tableView: UITableView!
 
    var cells: [Cell] = []
    
    func createArray() -> [Cell] {
        var homeCells: [Cell] = []
        
        let health = Cell(image: UIImage(named: "healthcare1.jpg")!, title: "Healthcare Tips", date: "")
        let news = Cell(image: UIImage(named: "pet_news.jpg")!, title: "Latest News", date: "")
        let media = Cell(image: UIImage(named: "media.png")!, title: "Media", date: "")
        let shop = Cell(image: UIImage(named: "toys1.png")!, title: "Shop", date: "")
        let recommened = Cell(image: UIImage(named: "dog_house.jpg")!, title: "Recommended", date: "")

        homeCells.append(health)
        homeCells.append(news)
        homeCells.append(media)
        homeCells.append(shop)
        homeCells.append(recommened)
        
        return homeCells
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellRows = cells[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        cell.setCell(cell: cellRows)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        let index = indexPath.row
        if index == 0 {
            let healthController = HealthViewController()
            self.navigationController?.pushViewController(healthController, animated: true)
        }
        else if index == 2 {
            let loginController = LoginViewController()
            self.navigationController?.pushViewController(loginController, animated: true)
            print("Media")
        }
        else if index == 3 {
            print("Shop")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340.0;//Choose your custom row height
    }
    
    func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }

    @IBOutlet var trailling: NSLayoutConstraint!
    @IBOutlet var leading: NSLayoutConstraint!
    @IBOutlet weak var homeButton: UIButton!
    private let settingsController = SettingsViewController()
    private let subscriptionController = SubscriptionViewController()
    @IBAction func settingButton(_ sender: Any) {
        self.show(settingsController, sender: self)
    }
    @IBAction func subscriptionsButton(_ sender: Any) {
        self.show(subscriptionController, sender: self)
    }
    
    var menuOut = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cells = createArray()
        tableView.delegate = self
        tableView.dataSource = self
        
        let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("PetDatabase.sqlite")
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK {
            print("Error opening database")
            return
        }
        
        let createTableQuery = "CREATE TABLE IF NOT EXISTS pets (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, gender TEXT, age INTEGER, breed TEXT, weight INTEGER, height INTEGER, comments TEXT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) !=
            SQLITE_OK{
            print("Error creating table")
            return
        }
        print("Everything is fine with database")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    @IBAction func menuTapped(_ sender: Any) {
        if menuOut == false {
            leading.constant = 150
            trailling.constant = -150
            menuOut = true
        }else {
            leading.constant = 0
            trailling.constant = 0
            menuOut = false 
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: { self.view.layoutIfNeeded()
        })
    }
}

