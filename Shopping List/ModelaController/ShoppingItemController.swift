//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Clean Mac on 5/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
 
    func initItems() {
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for itemName in itemNames {
            let item = ShoppingItem(name: itemName)
            shoppingItems.append(item)
        }
    }
    
    
    func toggleIt(for item: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: item) else { return }
        
        shoppingItems[index].inShoppingCart.toggle()
    }
    
    ///CRUD
    //Create
    func createItem(with name: String, inSchoppingCart: Bool) -> ShoppingItem {
        let shoppingItem = ShoppingItem(name: name, inShoppingCart: inSchoppingCart)
        shoppingItems.append(shoppingItem)
        self.saveToPersistantStore()
        return shoppingItem
    }
    
    //MARK: Persistance
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return directory.appendingPathComponent("shoppingItems.plist")
    }
    
    ///PERSISTANCE FUNCTIONS
    //Save
    private func saveToPersistantStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            NSLog("Error saving items data: \(error)")
        }
    }
    
    //Load
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            _ = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            NSLog("Error loading item data: \(error)")
        }
    }
    
    init() {
        let itemsAreInitialized = UserDefaults.standard.bool(forKey: .initializedKey)
        
        if itemsAreInitialized {
            loadFromPersistentStore()
        } else {
            initItems()
            saveToPersistantStore()
            UserDefaults.standard.set(true, forKey: .initializedKey)
        }
    }
    
}

extension String {
    static var initializedKey = "ItemsAreInitialized"
}

