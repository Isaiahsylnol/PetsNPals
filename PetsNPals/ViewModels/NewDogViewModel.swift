//
//  NewDogViewModel.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-02.
//

import Foundation
import UIKit

class NewDogViewModel {
    
    private var dogValues: Dog?
    
    let id: Int?
    let age: Int?
    let name: String?
    let gender: String?
    let breed: String?
    let weight: Int?
    let height: Int?
    let comment: String?
    
    init(dogValues: Dog?){
        self.dogValues = dogValues
        
        self.id = dogValues?.id
        self.age = dogValues?.age
        self.name = dogValues?.name
        self.gender = dogValues?.gender
        self.breed = dogValues?.breed
        self.weight = dogValues?.weight
        self.height = dogValues?.height
        self.comment = dogValues?.comment
        
    }
}
