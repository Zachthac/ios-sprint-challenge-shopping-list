//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Clean Mac on 5/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


struct ShopingItem: Equatable{
    var name: String
    
    var inShoppingCart: Bool
    
    var image: UIImage {
        guard let image = (UIImage(named: name)) else {return UIImage() }
        return image
}
}

    

