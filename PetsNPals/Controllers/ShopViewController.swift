//
//  ShopViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-29.
//

import UIKit

class ProdTableViewCell: UITableViewCell {
    
    static let identifier = "ProdTableViewCell"
    
    @IBOutlet weak var prodNameLabel: UILabel!
    @IBOutlet weak var prodPriceLabel: UILabel!
    @IBOutlet weak var prodDescriptionLabel: UILabel!
    @IBOutlet weak var prodRatingLabel: UILabel!
    @IBOutlet weak var prodSupplierLabel: UILabel!
    @IBOutlet weak var prodImage: UIImageView!
    
    func setCellWithValuesOf(_ prod: Product) {
        prodNameLabel.text = prod.name
        prodPriceLabel.text = "Price: \(String(prod.price))"
        prodDescriptionLabel.text = "Description: \(prod.description)"
        prodRatingLabel.text = "Rating: \(String(prod.rating))"
        prodSupplierLabel.text = "Supplier: \(prod.supplier)"
        let pic = UIImage(data: prod.photo)
        prodImage.image = pic
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class ShopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var name = ""
    var descriptions = ""
    var supplier = ""
    var rating = ""
    var price = ""
    var imaged = UIImage()
 
 
    @IBOutlet weak var shopTable: UITableView!
    private var viewModel = ProductViewModel()
    
    let cellReuseIdentifier = "cell"
    
    var db:DBHelper = DBHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        pets = db.read()
        viewModel.connectToDatabase()
 
        shopTable?.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        shopTable?.delegate = self
        shopTable?.dataSource = self
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
    
    var products:[Product] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProdTableViewCell", for: indexPath)
        let object = viewModel.cellForRowAt(indexPath: indexPath)
        products.append(viewModel.cellForRowAt(indexPath: indexPath))
        name = object.name
        descriptions = object.description
        supplier = object.supplier
        rating = String(object.rating)
        price = String(object.price)
        imaged = UIImage(data: object.photo)!
        if let shopCell = cell as? ProdTableViewCell {
            shopCell.setCellWithValuesOf(object)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        let index = indexPath.row
 
            if let productDetailView = storyboard?.instantiateViewController(withIdentifier: "ProdDetailsViewController") as? ProdDetailsViewController{
                productDetailView.name = products[index].name
                productDetailView.prodDescription = products[index].description
                productDetailView.supplier = products[index].supplier
                productDetailView.img = UIImage(data: products[index].photo)!
                productDetailView.rating = "Rating: \(String(products[index].rating))"
                productDetailView.price = "$\(String(products[index].price))"
                self.navigationController?.pushViewController(productDetailView, animated: true)
            }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

