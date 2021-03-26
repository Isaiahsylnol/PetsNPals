//
//  HealthTableViewCell.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-19.
//

import UIKit

class HealthTableViewCell: UITableViewCell {
    
    static let identifier = "HealthTableViewCell"
    
    private let myLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let date: UILabel = {
        let date = UILabel()
        return date
    }()
    
    private let paragraph: UITextView = {
       let para = UITextView()
        para.isEditable = false
        return para
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    public func configure() {
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
        contentView.addSubview(paragraph)
        contentView.addSubview(date)
        
        myLabel.text = "Your Pet's Anatomy"
        myLabel.font = myLabel.font.withSize(24)
        myLabel.textAlignment = .left
        date.text = "March 12, 2021"
        date.font = .systemFont(ofSize: 13)
        paragraph.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        paragraph.font = .systemFont(ofSize: 18)
        myImageView.image = UIImage(named: "dog_struct")
        myImageView.contentMode = .scaleAspectFill
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = CGRect(x: 25, y: 115, width: 350, height: 200)
        myLabel.frame = CGRect(x: 20, y: 10, width: contentView.frame.size.width-105, height: 100)
        paragraph.frame = CGRect(x: 20, y: 325, width: contentView.frame.size.width-40, height: 200)
        date.frame = CGRect(x: 20, y: 38, width: contentView.frame.size.width-105, height: 100)
        myImageView.layer.masksToBounds = true
        //myImageView.layer.cornerRadius = 50.0
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
