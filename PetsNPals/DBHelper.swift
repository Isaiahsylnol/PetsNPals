//
//  DBHelper.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-23.
//

import Foundation
import SQLite3

class DBHelper
{
    init()
    {
        db = openDatabase()
        createTable()
        createProductTable()
    }

    let dbPath: String = "pets.sqlite"
    var db:OpaquePointer?

    func openDatabase() -> OpaquePointer?
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS pets (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, gender TEXT, age INTEGER, breed TEXT, weight INTEGER, height INTEGER, comments TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("pet table created.")
            } else {
                print("pet table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insert( age:Int, name:String, gender:String, breed:String, weight:Int, height:Int, comments:String)
    {
        let pets = read()
        
        let insertStatementString = "INSERT INTO pets (age, name, gender, breed, weight, height, comments) VALUES (?, ?, ?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(insertStatement, 1, Int32(age))
            sqlite3_bind_text(insertStatement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (gender as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (breed as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 5, Int32(weight))
            sqlite3_bind_int(insertStatement, 6, Int32(height))
            sqlite3_bind_text(insertStatement, 7, (comments as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func read() -> [Dog] {
        let queryStatementString = "SELECT * FROM pets;"
        var queryStatement: OpaquePointer? = nil
        var psns : [Dog] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let gender = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let weight = sqlite3_column_int(queryStatement, 5)
                let breed = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let height = sqlite3_column_int(queryStatement, 6)
                let age = sqlite3_column_int(queryStatement, 3)
                let comments = String(describing: String(cString: sqlite3_column_text(queryStatement, 7)))
                psns.append(Dog(id: Int(id), age: Int(age), name: name, gender: gender, breed: breed, weight: Int(weight), height: Int(height), comment: comments))
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
    
    func deleteByID(id:Int) {
        let deleteStatementStirng = "DELETE FROM pets WHERE Id = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
    
    func createProductTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS products (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price REAL, supplier TEXT, rating INTEGER, description TEXT, image BLOB);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("product table created.")
            } else {
                print("product table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }


}

