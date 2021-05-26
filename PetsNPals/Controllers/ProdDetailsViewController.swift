//
//  ProdDetailsViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-05.
//

import UIKit
import BadgeHub
class ProdDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var supplierLabel: UILabel!
    @IBOutlet weak var prodImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBAction func addToCartButton(_ sender: UIButton) {
        hub?.increment()
        hub?.pop()
    }
    
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
   
    @objc func buttonAction(sender: UIButton!) {
        let addPetView = storyboard?.instantiateViewController(withIdentifier: "AddPetViewController") as! AddPetViewController
      self.present(addPetView, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
            let menuBarItem = UIBarButtonItem(customView: imageView)
 
            let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 40)
            currWidth?.isActive = true
            let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 40)
            currHeight?.isActive = true
            menuBarItem.customView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gotSettingPage)))
        
        self.navigationItem.rightBarButtonItem = menuBarItem

        setupImageView()

        nameLabel.text = name
        descriptionLabel.text = prodDescription
        supplierLabel.text = supplier
        prodImageView.image = img
        ratingLabel.text = rating
        priceLabel.text = price

        // Do any additional setup after loading the view.
    }
    
    @objc func gotSettingPage(){
        print("pressed")
       }
    
    private func setupImageView() {
        hub = BadgeHub(view: imageView)
        hub?.moveCircleBy(x: 8, y: 7)
        hub?.scaleCircleSize(by: CGFloat(0.90))
        view.addSubview(imageView)
    }
}
