//
//  G1roceryItemCollectionViewController.swift
//  Shopping List
//
//  Created by Clean Mac on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "GroceryCell"

class GroceryItemCollectionViewController: UICollectionViewController {
    
    var groceryController = ShoppingItemController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groceryController.shoppingItems.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell =  self.collectionView(collectionView, cellForItemAt: indexPath) as? GroceryCollectionViewCell,
            let groceryItem = cell.shoppingItem else { return }
        
        groceryController.toggleIt(for: groceryItem)
        collectionView.reloadData()
}

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? GroceryCollectionViewCell else { return UICollectionViewCell()}
        let groceryItem = groceryController.shoppingItems[indexPath.item]
        cell.shoppingItem = groceryItem
        
        return cell
}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            guard let detailVC = segue.destination as? GroceryListDetailViewController else { return }
            detailVC.delegate = groceryController.shoppingItems
        }
}
}







/*
 override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 return groceryController.shoppingItems.count
 }
 
 override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroceryCell", for: indexPath) as? GroceryCollectionViewCell else { return UICollectionViewCell() }
 let groceryItem = groceryController.shoppingItems[indexPath.item]
 cell.shoppingItem = groceryItem
 return cell
 }
 
 // MARK: UICollectionViewDelegate
 override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
 var item = groceryController.shoppingItems[indexPath.item]
 item.inShoppingCart.toggle()
 groceryController.shoppingItems[indexPath.item] = item
 groceryController.saveToPersistantStore()
 collectionView.reloadData()
 return true
 }
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 if segue.identifier == "detailSegue" {
 guard let addDetailVC = segue.destination as? GroceryListDetailViewController else { return }
 addDetailVC.shoppingItems = groceryController
 }
 }
 
 }
 */

