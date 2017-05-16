//
//  TemperaturePickerCell.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import UIKit

class TemperaturePickerCell: UICollectionViewCell {
    @IBOutlet weak var temperatureTypeLabel: UILabel!
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var temperatureUnitLabel: UILabel!
    
    override func layoutSubviews() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(white: 200.0/255.0, alpha: 1.0).cgColor
        self.layer.cornerRadius = 6
    }
}
