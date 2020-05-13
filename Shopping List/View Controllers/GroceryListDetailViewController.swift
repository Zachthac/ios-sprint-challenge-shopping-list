//
//  GroceryListDetailViewController.swift
//  Shopping List
//
//  Created by Clean Mac on 5/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class GroceryListDetailViewController: UIViewController {
    var shoppingItems: [ShoppingItem]? 

    var delegate: [ShoppingItem]?
    
    var shoppingItemController: ShoppingItemController?

    
    var cartCount: Int? {
        return shoppingItems?.count
    }
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var cartCountLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func updateView() {
        guard let itemCount = delegate?.count else { return }
        self.cartCountLabel.text = "You currently have \(itemCount) in your shopping cart"
    }
    
    @IBAction func changeShoppingListButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        guard let name = name.text, let address = address.text else { return }
        
        let alert = UIAlertController(title: "Delivery for \(name)! Your order is on the way", message: "Your delivery will arrive at \(address) in 15 minutes.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
        updateView()
        navigationController?.popViewController(animated: true)
    }
}
