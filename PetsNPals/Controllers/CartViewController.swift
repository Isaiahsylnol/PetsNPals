//
//  CartViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-06-01.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var cartTableView: UITableView!
    
    var prods = [ProductModel]()
    var name = ""
    var itemCount = 0
    
    @IBAction func removeButton(_ sender: UIButton) {
        print("removed")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let pic = UIImage(data: prods[indexPath.row].image!)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.prodTitle.text = name

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView?.dataSource = self
        cartTableView?.delegate = self
        
        print("from cart:\(name) & \(prods.count)")

    }
}
