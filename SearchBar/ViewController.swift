//
//  ViewController.swift
//  SearchBar
//
//  Created by Dhananjay on 18/01/23.
//

import UIKit
struct DataModel{
    var fname: String
    var lname: String
}
class ViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var arrData = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        dataModelSetUp()
        searchBarSetUp()
    }
    
    func dataModelSetUp(){
        arrData = [DataModel(fname: "Yogesh", lname: "Patel"), DataModel(fname: "Hemal", lname: "Patel"), DataModel(fname: "Dhruv", lname: "Patel"), DataModel(fname: "Hiren", lname: "Patel"), DataModel(fname: "Pujan", lname: "Patel"), DataModel(fname: "Chirag", lname: "Patel"), DataModel(fname: "Ashish", lname: "Patel"), DataModel(fname: "Binal", lname: "Patel"), DataModel(fname: "Simul", lname: "Patel"), DataModel(fname: "Hardik", lname: "Patel")]
    }
    
    func searchBarSetUp(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
}
extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        if searchText == ""{
            dataModelSetUp()
        }else{
            dataModelSetUp()
            arrData = arrData.filter{
                $0.fname.contains(searchText)
            }
        }
        tableView.reloadData()
    }
    
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = arrData[indexPath.row].fname
        cell.detailTextLabel?.text = arrData[indexPath.row].lname
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
}
