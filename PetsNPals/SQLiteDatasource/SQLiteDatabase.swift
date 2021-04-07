//
//  SQLiteDatabase.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-01.
//

import Foundation
import SQLite

class SQLiteDatabase {
    static let sharedInstance = SQLiteDatabase()
    var database: Connection?
    
    private init() {
        // Create connection to database
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            let fileUrl =
            documentDirectory
                .appendingPathComponent("PetsNPals")
                .appendingPathExtension("sqlite3")
            
            database = try Connection(fileUrl.path)
            print(documentDirectory)
        } catch {
            print("Creating connection to database error: \(error)")
        }
    }
    
    // Creating Table
    func createTable() {
        SQLiteCommands.createTable()
        SQLiteCommands.createProductTable()
    }
}
