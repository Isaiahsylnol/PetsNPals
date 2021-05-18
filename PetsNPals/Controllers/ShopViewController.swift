//
//  ShopViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-08.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var shopTableView: UITableView!
    var prods = [ProductModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
            prods = ModelManager.getInstance().getAllProducts()
            shopTableView?.reloadData()
        }
}

extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pic = UIImage(data: prods[indexPath.row].image)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        cell.nameLabel.text = prods[indexPath.row].name
        cell.supplierLabel.text = prods[indexPath.row].supplier
        cell.priceLabel.text = "Price: \(prods[indexPath.row].price)"
        cell.prodImage.image = pic
        cell.descriptionLabel.text = prods[indexPath.row].description
        cell.ratingLabel.text = "Rating: \(prods[indexPath.row].rating)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        let index = indexPath.row
 
            if let productDetailView = storyboard?.instantiateViewController(withIdentifier: "ProdDetailsViewController") as? ProdDetailsViewController{
                productDetailView.name = prods[index].name
                productDetailView.prodDescription = prods[index].description
                productDetailView.supplier = prods[index].supplier
                productDetailView.img = UIImage(data: prods[index].image)!
                productDetailView.rating = "Rating: \(String(prods[index].rating))"
                productDetailView.price = "$\(String(prods[index].price))"
                self.navigationController?.pushViewController(productDetailView, animated: true)
            }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
}
