//
//  ProductViewModel.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-04.
//

import Foundation

class ProductViewModel {
    
    private var prodArray = [Product]()
    
    func connectToDatabase() {
        _ = SQLiteDatabase.sharedInstance
    }
    
    func loadDataFromSQLiteDatabase() {
        prodArray = SQLiteCommands.presentProdRows() ?? []
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if prodArray.count != 0 {
            return prodArray.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Product {
        return prodArray[indexPath.row]
    }
    
}

