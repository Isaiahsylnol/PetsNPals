//
//  Cell.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-22.
//

import Foundation
import UIKit

class Cell {
    var image: UIImage
    var title: String
    var date: String
    init(image: UIImage, title: String, date: String){
        self.image = image
        self.title = title
        self.date = date
    }
}
