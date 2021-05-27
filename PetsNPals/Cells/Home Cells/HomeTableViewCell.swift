//
//  HomeTableViewCell.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-26.
//

import Foundation
import UIKit

// This class links the content to the display for the home tableView
class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    static let identifier = "HomeTableViewCell"
     
    func setCell(cell: Cell) {
        myImageView.image = cell.image
        titleLabel.text = cell.title
        titleLabel.font =  UIFont(name: "AvenirNext-Bold", size: 25.50)
    }

    public func configure() {
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

class Cell {
    var image: UIImage
    var title: String

    init(image: UIImage, title: String){
        self.image = image
        self.title = title
    }
}
