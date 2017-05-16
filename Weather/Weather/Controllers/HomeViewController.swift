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
    
    @IBOutlet weak var citiesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.customizeNavigation(navigationController: self.navigationController)
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        citiesTableView.reloadData()
    }
    
    //MARK: Private Functions
    /// Setup Table View attributes
    private func setupTableView() -> Void {
        citiesTableView.separatorColor = AppColor.PrimaryColor
        citiesTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (DataHub.sharedInstance.annotationsArray!.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Instantiate a cell
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "NGHomeCell")
        cell.textLabel?.text = (DataHub.sharedInstance.annotationsArray?[indexPath.row])?.title
        cell.detailTextLabel?.text = (DataHub.sharedInstance.annotationsArray?[indexPath.row])?.subtitle
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.textColor = AppColor.PrimaryColor
        cell.detailTextLabel?.textColor = AppColor.PrimaryColor
        return cell
    }
}
