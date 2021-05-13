//
//  HealthTableViewCell.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-19.
//

import UIKit

class HealthPostCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var paragraphTextArea: UITextView!
    
    func setPost(post: HealthPost) {
        titleLabel.text = post.title
        dateLabel.text = post.dateText
        articleImage.image = post.image
        paragraphTextArea.text = post.paragraph
    }
}

class HealthPost {
    
    var title: String
    var paragraph: String
    var image: UIImage
    var dateText: String
    
    init(title: String, para: String, image:UIImage, date: String) {
        self.title = title
        self.paragraph = para
        self.image = image
        self.dateText = date
    }
}
