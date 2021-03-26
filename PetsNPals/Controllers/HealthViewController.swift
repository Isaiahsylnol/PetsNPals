//
//  HealthViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-19.
//

import UIKit

class HealthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView()
        
        // Populate tableView with custom cells
        table.register(HealthTableViewCell.self, forCellReuseIdentifier: HealthTableViewCell.identifier)
        
        return table
    }()
    
 
    var images: [Cell] = []
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = .none
        // Push the child views once view loads
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
 
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // Number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Set our custom table cells to
    // their corresponding index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HealthTableViewCell.identifier, for: indexPath) as! HealthTableViewCell
        cell.configure()
        return cell
    }
    
  
}

