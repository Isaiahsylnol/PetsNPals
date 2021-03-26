//
//  Dog.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-23.
//

import Foundation

class Dog
{
    var id: Int = 0
    var age: Int = 0
    var name: String = ""
    var gender: String = ""
    var breed: String = ""
    var weight: Int = 0
    var height: Int = 0
    var comments: String = ""
    
    init(id:Int, age:Int, name:String, gender:String, breed:String, weight:Int, height:Int, comments:String) {
        self.id = id
        self.age = age
        self.name = name
        self.gender = gender
        self.breed = breed
        self.weight = weight
        self.height = height
        self.comments = comments
    }
}
