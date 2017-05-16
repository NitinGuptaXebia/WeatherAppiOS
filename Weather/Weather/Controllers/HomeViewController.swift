//
//  ViewController.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import UIKit

class HomeViewController: MasterViewController {

    let cellIdentifier = "NGHomeCell"
    var filterArray = Array<Annotation>()
    var isSearching = false
    var searchStr : String?
    
    @IBOutlet weak var citiesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.customizeNavigation(navigationController: self.navigationController)
        setupTableView()
        manageLoginView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        citiesTableView.reloadData()
        self.title = "Weather"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    //MARK: Private Functions
    /// Setup Table View attributes
    private func setupTableView() -> Void {
        citiesTableView.separatorColor = AppColor.PrimaryColor
        citiesTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    /// Manage the Login screen in case user is not logged in
    private func manageLoginView() {
        Utils.performWithDelay(seconds: 0.0) {
            if DataHub.sharedInstance.isLoggedIn == false {
                let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                self.present(loginVC, animated: true, completion: nil)
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
        detailVC.annotation = DataHub.sharedInstance.annotationsArray?[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        DataHub.sharedInstance.removeAnnotation(index: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let searchBar = UISearchBar.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        return searchBar
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching == true {
            return filterArray.count
        } else {
            return (DataHub.sharedInstance.annotationsArray!.count)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Instantiate a cell
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "NGHomeCell")
        cell.textLabel?.textColor = AppColor.PrimaryColor
        cell.detailTextLabel?.textColor = AppColor.PrimaryColor
        var title = ""
        var subTitle = ""
        if isSearching != true {
            title = ((DataHub.sharedInstance.annotationsArray?[indexPath.row])?.title)!
            subTitle = ((DataHub.sharedInstance.annotationsArray?[indexPath.row])?.subtitle)!
            cell.textLabel?.text = title
        } else {
            title = (filterArray[indexPath.row]).title!
            subTitle = (filterArray[indexPath.row]).subtitle!
            let range = (title as NSString).range(of: searchStr!, options: .caseInsensitive)
            let attributedString = NSMutableAttributedString(string:title)
            attributedString.addAttribute(NSForegroundColorAttributeName, value: AppColor.SecondaryColor , range: range)
            cell.textLabel?.attributedText = attributedString
        }

        cell.detailTextLabel?.text = subTitle
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
        searchStr = ""
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
        searchStr = nil
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchStr = searchText
        let arr = DataHub.sharedInstance.annotationsArray?.filter {
            $0.title?.range(of: searchText, options: .caseInsensitive) != nil
        }
        filterArray.removeAll()
        guard arr != nil else {
            filterArray.append(contentsOf: DataHub.sharedInstance.annotationsArray!)
            citiesTableView.reloadData()
            return
        }
        filterArray.append(contentsOf: arr!)
        citiesTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearching = false
        citiesTableView.reloadData()
    }
}
