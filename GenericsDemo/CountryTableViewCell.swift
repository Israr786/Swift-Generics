//
//  CountryTableViewCell.swift
//  GenericsDemo
//
//  Created by Israrul on 10/9/22.
//

import UIKit

class CountryTableViewCell: BaseCell<Country> {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var capital: UILabel!
    
    override var item: Country! {
        didSet {
            name.text = item.name
            region.text = item.region
            capital.text = item.capital
            code.text = item.code
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
