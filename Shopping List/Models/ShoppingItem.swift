//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Clean Mac on 5/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


struct ShoppingItem: Equatable, Codable{
  
    var name: String
    
    var inShoppingCart: Bool = false
    
    var image: UIImage? {
        return UIImage(named: name)
}
}

    

