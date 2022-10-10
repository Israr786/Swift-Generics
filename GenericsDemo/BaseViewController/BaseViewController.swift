//
//  BaseViewController.swift
//  GenericsDemo
//
//  Created by Israrul on 10/9/22.
//

import UIKit

class BaseViewController<T: BaseCell<U>, U>: UITableViewController {
    
    let cellId = "cellId"
    
    var items = [U]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     //   tableView.register(T.self, forCellReuseIdentifier: cellId)
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! BaseCell<U>
        cell.item = self.items[indexPath.row]
        return cell
    }
}
