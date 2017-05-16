//
//  MasterViewController.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    /*
     Show customized activity indicator,
     actually add activity indicator to passing view
     
     @param superView - add activity indicator to this view
     */
    func showActivityIndicator(superView: UIView) {
        container.frame = superView.frame
        container.center = superView.center
        container.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = superView.center
        let rgbVal : Float = 68.0/255.0
        loadingView.backgroundColor = UIColor(colorLiteralRed: rgbVal, green: rgbVal, blue: rgbVal, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2,
                                           y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        superView.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    /*
     Hide activity indicator
     Actually remove activity indicator from its super view
     
     @param superView - remove activity indicator from this view
     */
    func hideActivityIndicator(superView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }

}

