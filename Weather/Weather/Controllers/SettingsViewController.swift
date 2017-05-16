//
//  SettingsViewController.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import UIKit

class SettingsViewController: MasterViewController {
    var selectedIndex:IndexPath?
    let cellIdentifier = "TemperaturePickerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.customizeNavigation(navigationController: self.navigationController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancleAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SettingsViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TemperaturePickerCell
        cell.selectedImage.isHidden = true
        cell.temperatureTypeLabel.text = TempratureUnitType.getTemperatureTypeString(forType: TempratureUnitType(rawValue: indexPath.row)!)
        cell.temperatureUnitLabel.text = TempratureUnitType.getTemperatureUnit(forType: TempratureUnitType(rawValue: indexPath.row)!)
        if let savedVal = UserDefaults.standard.value(forKey: UserDefaultKeys.TemperaturUnitKey) {
            let rowTypeString = TempratureUnitType.getTempratureUnitKey(forType: TempratureUnitType(rawValue: indexPath.row)!)
            cell.selectedImage.isHidden = rowTypeString == (savedVal as! String) ? false : true
        }
        
        return cell
    }
}

extension SettingsViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if let index = self.selectedIndex{
            collectionView.deselectItem(at: index, animated: true)
        }
        let cell = collectionView.cellForItem(at: indexPath) as! TemperaturePickerCell
        cell.selectedImage.isHidden = false
        
        saveSelectedPreferences(indexPath: indexPath)
        
        collectionView.reloadData()
    }
    
    private func saveSelectedPreferences(indexPath: IndexPath) {
        let key = TempratureUnitType.getTempratureUnitKey(forType: TempratureUnitType(rawValue: indexPath.row)!)
        UserDefaults.standard.set(key, forKey: UserDefaultKeys.TemperaturUnitKey)
        UserDefaults.standard.synchronize()
    }

}
