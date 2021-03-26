//
//  SubscriptionTableViewCell.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-22.
//

import Foundation
import UIKit

class SubscriptionTableViewCell: UITableViewCell {

    static let identifier = "SubscriptionTableViewCell"
    @objc func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }

    public func configure() {

        let basicButton = UIButton(frame: CGRect(x: 0, y: 0, width: 93, height: 90))
        basicButton.backgroundColor = .systemGreen
        basicButton.setTitle("Basic", for: .normal)
        basicButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        let standardButton = UIButton(frame: CGRect(x: 125, y: 0, width: 93, height: 90))
        standardButton.backgroundColor = .systemGreen
        standardButton.setTitle("Standard", for: .normal)
        standardButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        let premiumButton = UIButton(frame: CGRect(x: 249, y: 0, width: 93, height: 90))
        premiumButton.backgroundColor = .systemGreen
        premiumButton.setTitle("Premium", for: .normal)
        premiumButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        let squareView = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        squareView.center = CGPoint(x:75, y: 68)
        squareView.addSubview(basicButton)
        self.contentView.addSubview(squareView)

        let squareView2 = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        squareView2.center = CGPoint(x: 85, y: 68)
        squareView2.addSubview(standardButton)
        self.contentView.addSubview(squareView2)

        let squareView3 = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        squareView3.center = CGPoint(x: 85, y: 68)
        squareView3.addSubview(premiumButton)
        self.contentView.addSubview(squareView3)
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

class Row1TableViewCell: UITableViewCell {

    static let identifier = "Row11TableViewCell"

    private let priceLabel1: UILabel = {
        let priceLabel1 = UILabel()
        return priceLabel1
    }()

    private let priceLabel2: UILabel = {
        let priceLabel2 = UILabel()
        return priceLabel2
    }()

    private let priceLabel3: UILabel = {
        let priceLabel3 = UILabel()
        return priceLabel3
    }()

    private let monthLabel: UILabel = {
        let monthLabel = UILabel()
        return monthLabel
    }()

    public func configure() {
        contentView.addSubview(priceLabel1)
        contentView.addSubview(priceLabel2)
        contentView.addSubview(priceLabel3)
        contentView.addSubview(monthLabel)

        priceLabel1.text = "$12.99"
        priceLabel1.font = priceLabel1.font.withSize(14)

        priceLabel2.text = "$24.99"
        priceLabel2.font = priceLabel2.font.withSize(14)

        priceLabel3.text = "$44.99"
        priceLabel3.font = priceLabel3.font.withSize(14)

        monthLabel.text = "Monthly Pricing"
        monthLabel.font = monthLabel.font.withSize(14)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        priceLabel1.frame = CGRect(x: 40, y: 55, width: 55, height: 40)
        priceLabel2.frame = CGRect(x: 190, y: 55, width: 55, height: 40)
        priceLabel3.frame = CGRect(x: 308, y: 55, width:  55, height: 40)
        monthLabel.frame = CGRect(x: 160, y: -4, width: 111, height: 80)
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

class Row2TableViewCell: UITableViewCell {

    static let identifier = "Row2TableViewCell"

    private let foodLabel: UILabel = {
        let foodLabel = UILabel()
        foodLabel.frame = CGRect(x: 168, y: 0, width: 100, height: 80)
        return foodLabel
    }()

    private let checkmark1: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let checkmark2: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let checkmark3: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    public func configure() {
        contentView.addSubview(foodLabel)
        contentView.addSubview(checkmark1)
        contentView.addSubview(checkmark2)
        contentView.addSubview(checkmark3)
        checkmark1.image = UIImage(systemName: "checkmark")
        checkmark2.image = UIImage(systemName: "checkmark")
        checkmark3.image = UIImage(systemName: "checkmark")
        foodLabel.text = "Food Basket"
        foodLabel.font = foodLabel.font.withSize(14)
        checkmark1.frame = CGRect(x: 50, y: 72, width: 30, height: 30)
        checkmark2.frame = CGRect(x: 190, y: 72, width: 30, height: 30)
        checkmark3.frame = CGRect(x: 320, y: 72, width: 30, height: 30)
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

class Row3TableViewCell: UITableViewCell {

    static let identifier = "Row3TableViewCell"

    private let magazineLabel: UILabel = {
        let magazineLabel = UILabel()
        magazineLabel.frame = CGRect(x: 148, y: 0, width: 160, height: 80)
        return magazineLabel
    }()

    private let checkmark1: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let checkmark2: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let checkmark3: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    public func configure() {
        contentView.addSubview(magazineLabel)
        contentView.addSubview(checkmark1)
        contentView.addSubview(checkmark2)
        contentView.addSubview(checkmark3)
        checkmark1.image = UIImage(systemName: "xmark")
        checkmark2.image = UIImage(systemName: "checkmark")
        checkmark3.image = UIImage(systemName: "checkmark")
        magazineLabel.text = "Pet Life Magazine"
        magazineLabel.font = magazineLabel.font.withSize(14)
        checkmark1.frame = CGRect(x: 50, y: 72, width: 30, height: 30)
        checkmark2.frame = CGRect(x: 190, y: 72, width: 30, height: 30)
        checkmark3.frame = CGRect(x: 320, y: 72, width: 30, height: 30)
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

class Row4TableViewCell: UITableViewCell {

    static let identifier = "Row4TableViewCell"

    private let petToysLabel: UILabel = {
        let petToysLabel = UILabel()
        petToysLabel.frame = CGRect(x: 168, y: 0, width: 160, height: 80)
        return petToysLabel
    }()

    private let checkmark1: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let checkmark2: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let checkmark3: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    public func configure() {
        contentView.addSubview(petToysLabel)
        contentView.addSubview(checkmark1)
        contentView.addSubview(checkmark2)
        contentView.addSubview(checkmark3)
        checkmark1.image = UIImage(systemName: "xmark")
        checkmark2.image = UIImage(systemName: "checkmark")
        checkmark3.image = UIImage(systemName: "checkmark")
        petToysLabel.text = "Pet Toys"
        petToysLabel.font = petToysLabel.font.withSize(14)
        checkmark1.frame = CGRect(x: 50, y: 72, width: 30, height: 30)
        checkmark2.frame = CGRect(x: 190, y: 72, width: 30, height: 30)
        checkmark3.frame = CGRect(x: 320, y: 72, width: 30, height: 30)
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

class Row5TableViewCell: UITableViewCell {

    static let identifier = "Row5TableViewCell"

    private let petToysLabel: UILabel = {
        let petToysLabel = UILabel()
        petToysLabel.frame = CGRect(x: 168, y: 0, width: 160, height: 80)
        return petToysLabel
    }()

    private let checkmark1: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let checkmark2: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let checkmark3: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    public func configure() {
        contentView.addSubview(petToysLabel)
        contentView.addSubview(checkmark1)
        contentView.addSubview(checkmark2)
        contentView.addSubview(checkmark3)
        checkmark1.image = UIImage(systemName: "xmark")
        checkmark2.image = UIImage(systemName: "xmark")
        checkmark3.image = UIImage(systemName: "checkmark")
        petToysLabel.text = "Apparel"
        petToysLabel.font = petToysLabel.font.withSize(14)
        checkmark1.frame = CGRect(x: 50, y: 72, width: 30, height: 30)
        checkmark2.frame = CGRect(x: 190, y: 72, width: 30, height: 30)
        checkmark3.frame = CGRect(x: 320, y: 72, width: 30, height: 30)
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




