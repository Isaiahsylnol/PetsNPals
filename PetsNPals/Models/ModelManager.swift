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
    
    // Saving User Data
    func SaveUser(user : UserModel) -> Bool {
        shareInstance.database?.open()
        
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO User (name, username, email, password, address, phone, phone2) VALUES(?,?,?,?,?,?,?)", withArgumentsIn: [nil, user.username, user.email, user.password, nil, nil, nil])
        
        shareInstance.database?.close()
        return isSave!
    }
    
    // Fetch Single - User data
    func findUser(user_email: String) -> [UserModel] {
        shareInstance.database?.open()
        var users = [UserModel]()
        do{
            let resultSet: FMResultSet? = try shareInstance.database?.executeQuery("SELECT * FROM User WHERE email=?", withArgumentsIn: [user_email])
            
            if resultSet != nil{
                while resultSet!.next() {
                    
                    let user = UserModel(id: Int(resultSet!.int(forColumn: "id")), name: resultSet!.string(forColumn: "name"), username: resultSet!.string(forColumn: "username")!, email: resultSet!.string(forColumn: "email")!, password: resultSet!.string(forColumn: "password")!, address: resultSet!.string(forColumn: "address"), phone: resultSet!.string(forColumn: "phone"), phone2: (resultSet!.string(forColumn: "phone2")))
                    users.append(user)
                }
            }
        }
        catch let err{
            print(err.localizedDescription)
        }
        shareInstance.database?.close()
        return users
    }
    
    // Fetch All - User data
    func getAllUsers() -> [UserModel]{
        shareInstance.database?.open()
        var users = [UserModel]()
        do{
            let resultSet: FMResultSet? = try shareInstance.database?.executeQuery("SELECT * FROM User", values: nil)
            
            if resultSet != nil{
                while resultSet!.next() {
                    
                    let user = UserModel(id: Int(resultSet!.int(forColumn: "id")), name: resultSet!.string(forColumn: "name"), username: resultSet!.string(forColumn: "username")!, email: resultSet!.string(forColumn: "email")!, password: resultSet!.string(forColumn: "password")!, address: resultSet!.string(forColumn: "address"), phone: resultSet!.string(forColumn: "phone"), phone2: (resultSet!.string(forColumn: "phone2")))
                    users.append(user)
                }
            }
        }
        catch let err{
            print(err.localizedDescription)
        }
        shareInstance.database?.close()
        return users
    }
    
    // Save - Partner Data
    func SavePet(pet : DogModel) -> Bool {
        shareInstance.database?.open()
        
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO Dog (name, breed, age, weight, height, gender, comment) VALUES(?,?,?,?,?,?,?) ", withArgumentsIn: [pet.name, pet.breed, pet.age, pet.weight, pet.height, pet.gender, pet.comment])
        
        shareInstance.database?.close()
        return isSave!
    }
    
    // Fetch - Pet data
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
    
    // Update - Pet Info
    func updatePet(pet: DogModel) ->Bool {
        shareInstance.database?.open()
        
        let isUpdate = shareInstance.database?.executeUpdate("UPDATE dog SET name=?, gender=?, breed=?, weight=?, height=?, comment=? WHERE id=?", withArgumentsIn: [pet.name, pet.gender, pet.breed, pet.weight, pet.height, pet.comment, pet.id])
        shareInstance.database?.close()
        return isUpdate!
    }
    
    // Delete Pet Record
    func deletePet(dog: DogModel)
    -> Bool {
        shareInstance.database?.open()
        
        let isDeleted = shareInstance.database?.executeUpdate("DELETE FROM dog WHERE id=?", withArgumentsIn: [dog.id])
        
        shareInstance.database?.close()
        return isDeleted!
    }
    
    // Product Queiries
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
