//
//  GroceryCollectionViewCell.swift
//  Shopping List
//
//  Created by Clean Mac on 5/10/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class GroceryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOUTLETS 
    
    @IBOutlet weak var groceryInCartLabel: UILabel!
    @IBOutlet weak var groceryImageView: UIImageView!
    @IBOutlet weak var groceryItemLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        guard let item = shoppingItem else { return }
        if item.inShoppingCart {
            groceryInCartLabel.text = "Added"
        } else {
            groceryInCartLabel.text = "Not Added"
        }
        groceryImageView.image = UIImage(named: item.name)
        groceryItemLabel.text = item.name
    }
}
