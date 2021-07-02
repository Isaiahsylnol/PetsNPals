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
    
    @objc func decrementQuantity(_ sender: UIButton) {
        if(num <= 1){
                print("can't have less than 1 quantity")
            }
        else {
            num-=1
        }
        print(num)
        cartTableView.reloadData()
        //quantityLabel.text = String(num)
    }
    
    @objc func deleteItem(_ sender: UIButton) {
        print("deletion pressed \(sender.tag)")
        
        
    }
    
    static var prods = [ProductModel]()

    var itemCount = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartViewController.prods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let pic = UIImage(data: CartViewController.prods[indexPath.row].image!)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        
        cell.prodTitle.text = CartViewController.prods[indexPath.row].name
        cell.prodPrice.text = "$\(CartViewController.prods[indexPath.row].price)"
       
        cell.quantityLabel.tag = indexPath.row
        cell.increamentQuantityBtn.tag = indexPath.row
        cell.decreamentQuantityBtn.tag = indexPath.row
        cell.increamentQuantityBtn.addTarget(self, action: #selector(incrementQuantity(_:)), for: .touchUpInside)
        cell.decreamentQuantityBtn.addTarget(self, action: #selector(decrementQuantity(_:)), for: .touchUpInside)
        
        cell.quantityLabel.text = String(num)
        cell.removeItem.tag = indexPath.row
        cell.removeItem.addTarget(self, action: #selector(deleteItem(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Sliding delete functionality
        CartViewController.prods.remove(at: indexPath.row)
        cartTableView.deleteRows(at: [indexPath], with: .fade)
        cartTableView.endUpdates()
        cartTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 222
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView?.dataSource = self
        cartTableView?.delegate = self
        
        //print("from cart:\(name) & \(itemCount)")
//        print("Item Quantity: \(num)")
        for i in CartViewController.prods{
            print(i.name)
        }
        print("Cart Quantity: \(CartViewController.prods.count)")
//        print(CartViewController.prods[0].name)
    }
}
