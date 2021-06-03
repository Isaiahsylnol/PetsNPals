//
//  CartViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-06-01.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Properties
    @IBOutlet weak var cartTableView: UITableView!

    var num = 1
    @objc func incrementQuantity(_ sender: UIButton) {
        num+=1
        print(num)
        cartTableView.reloadData()
        //quantityLabel.text = String(num)
    }
    
    var prods = [ProductModel]()
    var name = ""
    var price = ""
    var img = UIImage()
    var itemCount = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let pic = UIImage(data: prods[indexPath.row].image!)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.prodTitle.text = name
        cell.prodPrice.text = "$\(price)"
        cell.prodImage.image = img
        cell.quantityLabel.text = String(num)
        cell.increamentQuantityBtn.tag = indexPath.row
        cell.increamentQuantityBtn.addTarget(self, action: #selector(incrementQuantity(_:)), for: .touchUpInside)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView?.dataSource = self
        cartTableView?.delegate = self
        
        //print("from cart:\(name) & \(itemCount)")
        print(num)
        for i in prods{
            print(i.name)
        }
    }
}
