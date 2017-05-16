//
//  ViewController.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import UIKit

class HomeViewController: MasterViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.customizeNavigation(navigationController: self.navigationController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

