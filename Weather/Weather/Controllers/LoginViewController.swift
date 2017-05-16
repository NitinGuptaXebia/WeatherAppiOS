//
//  LoginViewController.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import UIKit

class LoginViewController: MasterViewController {
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.backgroundColor = UIColor.gray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        _registerForKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        _unregisterForKeyboardNotification()
    }
    
    fileprivate func updateButtonState() {
        guard let  username = userNameTF.text, let password = passwordTF.text else { loginButton.isEnabled = false
            return
        }
        let enableLogin = !username.isEmpty && !password.isEmpty
        loginButton.isEnabled = enableLogin
        if loginButton.isEnabled == true {
            loginButton.backgroundColor = AppColor.PrimaryColor
        } else {
            loginButton.backgroundColor = UIColor.gray
        }
    }
    
    @IBAction func login(_ sender: Any) {
        view.resignFirstResponder()
        guard let username = userNameTF.text,
            let password = passwordTF.text else { return  }
        if username.lowercased() == "backbase" && password.lowercased() == "nitingupta"{
            loginButton.isEnabled = false
            DataHub.sharedInstance.isLoggedIn = true
            dismiss(animated: true, completion: nil)
        } else {
            // Invalid Login
            Utils.showAlert(title: "Oops!!", message: "Invalid username or password", actions: nil)
            userNameTF.text = ""
            passwordTF.text = ""
        }
    }
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField){
        updateButtonState()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



extension LoginViewController {
    fileprivate  func _registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    
    fileprivate func _unregisterForKeyboardNotification() {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    
    @objc fileprivate func handleKeyboardWillShow( notification: Notification) {
        
        guard let userInfo = notification.userInfo else { return }
        
        // Convert the keyboard frame from screen to view coordinates.
        let keyboardScreenBeginFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        
        _ = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let keyboardViewBeginFrame = view.convert(keyboardScreenBeginFrame, from: view.window)
        
        
        let kbSize = keyboardViewBeginFrame.size
        
        var aRect = self.containerView.frame;
        aRect.size.height -= kbSize.height
        
        // Adjust bottom contentInsets of tableview
        
        
    }
    
    @objc fileprivate func  handleKeyboardWillHide( notification: NSNotification)  {
        guard let userInfo = notification.userInfo else { return }
        
        let keyboardScreenBeginFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        
        _ = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let keyboardViewBeginFrame = view.convert(keyboardScreenBeginFrame, from: view.window)
        
        let kbSize = keyboardViewBeginFrame.size
        
        var aRect = self.containerView.frame;
        aRect.size.height -= kbSize.height
        
    }
}
