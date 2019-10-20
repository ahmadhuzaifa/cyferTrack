//
//  SearchViewController.swift
//  Cyfer Track
//
//  Created by Huzaifa Ahmed on 10/19/19.
//  Copyright © 2019 cyferlabs. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
     let searchController = UISearchController(searchResultsController: nil)
    var itemDict1 = ["id": "321123fqeqw", "name": "Lettuce" as AnyObject, "distance": 231 as AnyObject] as [String : AnyObject]
    var itemDict2 = ["id": "2132312132", "name": "Tomatoes" as AnyObject, "distance": 231 as AnyObject] as [String : AnyObject]


    var items = [Item]()

    var filteredItems = [Item]()

        func searchBarIsEmpty() -> Bool {
            return searchController.searchBar.text?.isEmpty ?? true
        }
        func isFiltering() -> Bool {
            return searchController.isActive && !searchBarIsEmpty()
        }
       
        func filterContentForSearchText(_ searchText: String, scope: String = "All") {
            filteredItems = items.filter({( item : Item) -> Bool in
                return item.name!.lowercased().contains(searchText.lowercased())
            })
            tableView.reloadData()
        }
        @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        searchController
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Items"
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
        }
        definesPresentationContext = true

        tableView.delegate = self
        tableView.dataSource = self
        tableView.dequeueReusableCell(withIdentifier: "Cell")
        // Do any additional setup after loading the view.
        
        
        items.append(Item(dictionary: itemDict1))

    }


}
extension SearchViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredItems.count
        }
        
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! searchCell
        let searchedItem: Item
        if isFiltering() {
            searchedItem = filteredItems[indexPath.row]
        } else {
            searchedItem = items[indexPath.row]
        }
        cell.titleLabel!.text = searchedItem.name
        cell.addressLabel!.text = searchedItem.address

        //        cell.detailTextLabel!.text = place.category
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
class searchCell: UITableViewCell{
    @IBOutlet var photoView: UIImageView!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        photoView.layer.masksToBounds = true
        photoView.layer.cornerRadius = 5
        
    }
}
