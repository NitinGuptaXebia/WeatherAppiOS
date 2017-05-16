//
//  HelpViewController.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import UIKit

class HelpViewController: MasterViewController {

    @IBOutlet weak var webVieW: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Help"
        showActivityIndicator(superView: self.view)
        let htmlFile = Bundle.main.path(forResource: "Help", ofType: "html")
        let url = URL.init(fileURLWithPath: htmlFile!)
        let html = try? String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)
        webVieW.loadHTMLString(html!, baseURL: url)
        webVieW.delegate = self
    }
}

extension HelpViewController : UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        hideActivityIndicator(superView: self.view)
    }
}
