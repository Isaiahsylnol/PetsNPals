//
//  SubscriptionViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-22.
//

import Foundation
import UIKit

class SubscriptionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView()
        
        // Register custom cells
        table.register(SubscriptionTableViewCell.self, forCellReuseIdentifier: SubscriptionTableViewCell.identifier)
        table.register(Row1TableViewCell.self, forCellReuseIdentifier: Row1TableViewCell.identifier)
        table.register(Row2TableViewCell.self, forCellReuseIdentifier: Row2TableViewCell.identifier)
        table.register(Row3TableViewCell.self, forCellReuseIdentifier: Row3TableViewCell.identifier)
        table.register(Row4TableViewCell.self, forCellReuseIdentifier: Row4TableViewCell.identifier)
        table.register(Row5TableViewCell.self, forCellReuseIdentifier: Row5TableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        view.addSubview(tableView)
        //tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // Number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    // Make table cells non selectable
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // Set our custom table cells to
    // their corresponding index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Populate table indexes with custom cells
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Row1TableViewCell.identifier, for: indexPath) as! Row1TableViewCell
            cell.configure()
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Row2TableViewCell.identifier, for: indexPath) as! Row2TableViewCell
            cell.configure()
            return cell
        }
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Row3TableViewCell.identifier, for: indexPath) as! Row3TableViewCell
            cell.configure()
            return cell
        }
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Row4TableViewCell.identifier, for: indexPath) as! Row4TableViewCell
            cell.configure()
            return cell
        }
        if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Row5TableViewCell.identifier, for: indexPath) as! Row5TableViewCell
            cell.configure()
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SubscriptionTableViewCell.identifier, for: indexPath) as! SubscriptionTableViewCell
        cell.configure()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0;//Choose your custom row height
    }
}
