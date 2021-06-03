//
//  CartTableViewCell.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-06-01.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var prodTitle: UILabel!
    @IBOutlet weak var prodPrice: UILabel!
    @IBOutlet weak var prodImage: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
 
    @IBOutlet weak var increamentQuantityBtn: UIButton!
    
    @IBAction func removeItemButton(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
