//
//  ProdDetailsViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-05.
//

import UIKit

class ProdDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var supplierLabel: UILabel!
    @IBOutlet weak var prodImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var name = ""
    var prodDescription = ""
    var supplier = ""
    var rating = ""
    var price = ""
    var img = UIImage()
    
    @objc func buttonAction(sender: UIButton!) {
        let addPetView = storyboard?.instantiateViewController(withIdentifier: "AddPetViewController") as! AddPetViewController
      self.present(addPetView, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonAction)), animated: true)
        
        nameLabel.text = name
        descriptionLabel.text = prodDescription
        supplierLabel.text = supplier
        prodImageView.image = img
        ratingLabel.text = rating
        priceLabel.text = price

        // Do any additional setup after loading the view.
    }
}
