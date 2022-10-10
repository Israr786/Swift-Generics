//
//  BaseCell.swift
//  GenericsDemo
//
//  Created by Israrul on 10/9/22.
//
import UIKit

class BaseCell<U>: UITableViewCell {
    
    var item: U!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
