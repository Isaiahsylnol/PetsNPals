//
//  ProdDetailsViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-05.
//

import UIKit
import BadgeHub
class ProdDetailsViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var supplierLabel: UILabel!
    @IBOutlet weak var prodImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    static var prods = [ProductModel]()
    
   private var hub: BadgeHub?
 
    var name = ""
    var prodDescription = ""
    var supplier = ""
    var rating = ""
    var price = ""
    var img = UIImage()
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.frame = CGRect(x: view.frame.size.width / 2 - 48,
                          y: 80, width: 36, height: 30)
        iv.image = UIImage(named: "cart3x")
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
            let cartBarItem = UIBarButtonItem(customView: imageView)
 
            let currWidth = cartBarItem.customView?.widthAnchor.constraint(equalToConstant: 40)
            currWidth?.isActive = true
            let currHeight = cartBarItem.customView?.heightAnchor.constraint(equalToConstant: 40)
            currHeight?.isActive = true
            cartBarItem.customView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showCart)))
        
        self.navigationItem.rightBarButtonItem = cartBarItem
        
        setupImageView()

        nameLabel.text = name
        descriptionLabel.text = prodDescription
        supplierLabel.text = supplier
        prodImageView.image = img
        ratingLabel.text = "rating: \(rating)"
        priceLabel.text = "$\(price)"
    }
    
    // MARK: - Add item selected to user cart, increment the cart badge item count
    @IBAction func addToCartButton(_ sender: UIButton) {
        hub?.increment()
        hub?.pop()

        let prod = ProductModel(id: 0, url: "nil", name: name, breed: "nil", price: Double(price)!, supplier: supplier, rating: Int(rating)!, description: prodDescription, image: nil)
        CartViewController.prods.append(prod)
    }
    
    // MARK: - Present Cart View populated with stored user items
    @objc func showCart(){

        let cartView = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        
      
        cartView.itemCount = ProdDetailsViewController.prods.count
        navigationController?.pushViewController(cartView, animated: true)
       }
    
    private func setupImageView() {
        hub = BadgeHub(view: imageView)
        hub?.moveCircleBy(x: 8, y: 7)
        hub?.scaleCircleSize(by: CGFloat(0.90))
        view.addSubview(imageView)
    }
}
