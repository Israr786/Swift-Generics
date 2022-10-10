//
//  SomeListController.swift
//  GenericsDemo
//
//  Created by Israrul on 10/9/22.
//

import UIKit

class SomeListController: BaseViewController<CountryTableViewCell, Country> {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var countryList = [Country]()
    var searchedCountry = [Country]()
    var searching = false
    
    let data = ContentService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        data.getItemData { result in
            switch result {
            case .success(let countries):
                print(countries)
                self.items = countries
                self.countryList = countries
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            items = searchedCountry
            return searchedCountry.count
        } else {
            items = countryList
            return countryList.count
        }
    }
}

extension SomeListController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedCountry = countryList.filter {
            $0.name.lowercased().prefix(searchText.count) == searchText.lowercased()
        }
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}

