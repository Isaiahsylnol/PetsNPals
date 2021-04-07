//
//  ManagePetViewModel.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-04.
//

import Foundation

class ManagePetViewModel {
    
    private var petArray = [Dog]()
    
    func connectToDatabase() {
        _ = SQLiteDatabase.sharedInstance
    }
    
    func loadDataFromSQLiteDatabase() {
        petArray = SQLiteCommands.presentRows() ?? []
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if petArray.count != 0 {
            return petArray.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Dog {
        return petArray[indexPath.row]
    }
    
}
