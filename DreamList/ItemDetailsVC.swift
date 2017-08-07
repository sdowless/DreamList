//
//  ItemDetailsVC.swift
//  DreamList
//
//  Created by Stephan Dowless on 1/6/17.
//  Copyright © 2017 Stephan Dowless. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    var itemToUpload: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if itemToUpload != nil {
            loadItemData()
        }
    }
    
    @IBAction func saveItem(_ sender: UIButton) {
        
        var item: Item!
        
        if itemToUpload == nil {
            item = Item(context: context)
        } else {
            item = itemToUpload
        }
        
        if let title = titleField.text {
            item.title = title
        }
        
        if let price = priceField.text {
            item.price = (price as NSString).doubleValue
            
        }
        
        if let details = detailsField.text {
            item.details = details
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    func loadItemData() {
        if let item = itemToUpload {
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
        }
    }

    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        if itemToUpload != nil {
            context.delete(itemToUpload!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loadImage(_ sender: UIButton) {
    }
}
