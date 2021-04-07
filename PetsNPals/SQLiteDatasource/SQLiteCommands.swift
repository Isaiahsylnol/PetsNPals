//
//  SQLiteCommands.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-01.
//

import Foundation
import SQLite

class SQLiteCommands {
    
    static var table = Table("pet")
    
    // Expressions
    static let id = Expression<Int>("id")
    static let age = Expression<Int>("age")
    static let name = Expression<String>("name")
    static let gender = Expression<String>("gender")
    static let breed = Expression<String>("breed")
    static let weight = Expression<Int>("weight")
    static let height = Expression<Int>("height")
    static let comment = Expression<String>("comments")
    
    // Creating Table
    static func createTable() {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        do {
            try database.run(table.create(ifNotExists: true) {
                table in table.column(id, primaryKey: true)
                table.column(age)
                table.column(name)
                table.column(gender)
                table.column(breed)
                table.column(weight)
                table.column(height)
                table.column(comment)
            })
        } catch {
            print("Table already exists: \(error)")
        }
    }
    
    static var prodTable = Table("product")
    
    // Expressions
    static let prodId = Expression<Int>("id")
    static let prodName = Expression<String>("name")
    static let price = Expression<Int>("price")
    static let supplier = Expression<String>("supplier")
    static let rating = Expression<Int>("rating")
    static let description = Expression<String>("description")
    static let photo = Expression<Data>("photo")
    
    // Creating Table
    static func createProductTable() {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        do {
            try database.run(prodTable.create(ifNotExists: true) {
                table in table.column(id, primaryKey: true)
                table.column(name)
                table.column(price)
                table.column(rating)
                table.column(supplier)
                table.column(description)
                table.column(photo)
            })
        } catch {
            print("Product Table already exists: \(error)")
        }
    }
    
    // Inserting Product Row
    static func insertProductRow(_ productValues:Product) -> Bool? {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        do {
            try database.run(prodTable.insert(name <- productValues.name, price <- productValues.price, supplier <- productValues.supplier, rating <- productValues.rating, description <- productValues.description, photo <- productValues.photo))
            return true
        } catch let Result.error(message, code, statement) where code
        == SQLITE_CONSTRAINT {
            print("Insert row failed: \(message), in \(String(describing: statement))")
            return false
        } catch let error {
            print("Insertion failed: \(error)")
            return false
        }
    }
    
    // Inserting Row
    static func insertRow(_ dogValues:Dog) -> Bool? {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        do {
            try database.run(table.insert(age <- dogValues.age, name <- dogValues.name, gender <- dogValues.gender, breed <- dogValues.breed, weight <- dogValues.weight, height <- dogValues.height, comment <- dogValues.comment))
            return true
        } catch let Result.error(message, code, statement) where code
        == SQLITE_CONSTRAINT {
            print("Insert row failed: \(message), in \(String(describing: statement))")
            return false
        } catch let error {
            print("Insertion failed: \(error)")
            return false
        }
    }
    
    static func presentRows() -> [Dog]? {
        guard let database =
                SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        var petArray = [Dog]()
        
        table = table.order(id.desc)
        
        do {
            for dog in try database.prepare(table) {
                let idValue = dog[id]
                let ageValue = dog[age]
                let nameValue = dog[name]
                let genderValue = dog[gender]
                let breedValue = dog[breed]
                let weightValue = dog[weight]
                let heightValue = dog[height]
                let commentsValue = dog[comment]
                
                // Create object
                let dogObject = Dog(id: idValue, age: ageValue, name: nameValue, gender: genderValue, breed: breedValue, weight: weightValue, height: heightValue, comment: commentsValue)
                
                petArray.append(dogObject)
                
                print("id \(dog[id]), age \(dog[age]), name \(dog[name]), gender \(dog[gender]), weight \(dog[weight]), height \(dog[height]), comments \(dog[comment]),")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return petArray
    }
    
    static func presentProdRows() -> [Product]? {
        guard let database =
                SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        var prodArray = [Product]()
        
        prodTable = prodTable.order(id.desc)
        
        do {
            for product in try database.prepare(prodTable) {
                let idValue = product[id]
                let nameValue = product[name]
                let priceValue = product[price]
                let descriptionValue = product[description]
                let supplierValue = product[supplier]
                let ratingValue = product[rating]
                let imageValue = product[photo]
                
                // Create object
                let prodObject = Product(id: idValue, name: nameValue, price: Int(priceValue), supplier: supplierValue, rating: ratingValue, description: descriptionValue, photo: imageValue)
                
                prodArray.append(prodObject)
                
                print("id \(product[id]), name \(product[name]), price \(product[price]), description \(product[description]), rating \(product[rating]), supplier \(product[supplier]), photo: \(photo)")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return prodArray
    }
}
