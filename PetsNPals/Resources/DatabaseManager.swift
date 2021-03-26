//
//  DatabaseManager.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-26.
//

import FirebaseDatabase
import Foundation

public class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    // MARK: - Public
    
    // Check if username and email are available
    // - Parameters
    //      - email: String repersenting email
    //      - username: String repersenting username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void){
        completion(true)
    }
    
    // Inserts new user data to database
    // - Parameters
    //      - email: String repersenting email
    //      - username: String repersenting username
    //      - completion: Async callback for result if database entry succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        database.child(key.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                // succeeded
                completion(true)
                return
            }
            else {
                // failed
                completion(false)
                return
            }
        }
    }
}
