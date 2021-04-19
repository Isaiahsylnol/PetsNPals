//
//  ModelManager.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-06.
//

import Foundation
import UIKit

var shareInstance = ModelManager()

class ModelManager{
    
    var database: FMDatabase? = nil
    
    static func getInstance() -> ModelManager {
        if shareInstance.database == nil {
            shareInstance.database = FMDatabase(path: Util.share.getPath(dbName: "PetsNPalsDB.db"))
        }
        return shareInstance
    }
    
    // Saving Partner Data
    func SavePet(pet : DogModel) -> Bool {
        shareInstance.database?.open()
        
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO Dog (name, breed, age, weight, height, gender, comment) VALUES(?,?,?,?,?,?,?) ", withArgumentsIn: [pet.name, pet.breed, pet.age, pet.weight, pet.height, pet.gender, pet.comment])
        
        shareInstance.database?.close()
        return isSave!
    }
    
    func getAllPets() -> [DogModel]{
        shareInstance.database?.open()
        var dogs = [DogModel]()
        do{
            let resultSet: FMResultSet? = try shareInstance.database?.executeQuery("SELECT * FROM Dog", values: nil)
            
            if resultSet != nil{
                while resultSet!.next() {
                    
                    let pet = DogModel(id: Int(resultSet!.int(forColumn: "id")), age: Int(resultSet!.int(forColumn: "age")), name: resultSet!.string(forColumn: "name")!, gender: resultSet!.string(forColumn: "gender")!, breed: resultSet!.string(forColumn: "breed")!, weight: resultSet!.double(forColumn: "weight"), height: resultSet!.double(forColumn: "height"), comment: (resultSet!.string(forColumn: "comment"))!)
                    dogs.append(pet)
                }
            }
        }
        catch let err{
            print(err.localizedDescription)
        }
        shareInstance.database?.close()
        return dogs
    }
    
    
//    Product Queiries
    func getAllProducts() -> [ProductModel]{
        shareInstance.database?.open()
        var products = [ProductModel]()
        do{
            let resultSet: FMResultSet? = try shareInstance.database?.executeQuery("SELECT * FROM product", values: nil)
            
            if resultSet != nil{
                while resultSet!.next() {
                    
                    let prod = ProductModel(id: Int(resultSet!.int(forColumn: "id")), url: resultSet!.string(forColumn: "url")!, name: resultSet!.string(forColumn: "name")!, breed: resultSet!.string(forColumn: "breed")!, price: resultSet!.double(forColumn: "price"), supplier: resultSet!.string(forColumn: "supplier")!, rating: Int(resultSet!.int(forColumn: "rating")), description: resultSet!.string(forColumn: "description")!, image: resultSet!.data(forColumn: "image")!)
                    products.append(prod)
                }
            }
        }
        catch let err{
            print(err.localizedDescription)
        }
        shareInstance.database?.close()
        return products
    }
    
    // Saving Product Data
    func SaveProduct(prod : ProductModel) -> Bool {
        shareInstance.database?.open()
        
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO product (url, name, breed, price, supplier, rating, description, image) VALUES(?,?,?,?,?,?,?,?) ", withArgumentsIn: [prod.url, prod.name, prod.breed, prod.price, prod.supplier, prod.rating, prod.description, prod.image])
        
        shareInstance.database?.close()
        return isSave!
    }
    
}
