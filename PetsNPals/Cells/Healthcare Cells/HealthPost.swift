//
//  HealthPost.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-13.
//

import Foundation
import UIKit

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
