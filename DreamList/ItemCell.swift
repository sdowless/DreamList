//
//  ItemCell.swift
//  DreamList
//
//  Created by Stephan Dowless on 1/6/17.
//  Copyright © 2017 Stephan Dowless. All rights reserved.
//

import UIKit

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!


    func updateCell(item: Item) {
        title.text = item.title
        price.text = "\(item.price)"
        details.text = item.details
    }
}
