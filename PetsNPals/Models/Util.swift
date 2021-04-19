//
//  Util.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-06.
//

import Foundation
import UIKit

class Util {
    
    static let share = Util()
    
    // Get path of the database
    func getPath(dbName: String)->String{
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = documentDirectory.appendingPathComponent(dbName)
        print(fileUrl.path)
        return fileUrl.path
    }
    
    // If database path is not existing, create one
    func copyDatabase(dbName: String){
        let dbPath = getPath(dbName: "PetsNPalsDB.db")
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath){
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(dbName)
            do{
                try fileManager.copyItem(atPath: file!.path, toPath: dbPath)
            }
            catch let err{
                print(err.localizedDescription)
            }
        }
    }
}
