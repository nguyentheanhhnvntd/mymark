//
//  SignInViewController.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/19/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignInViewController: MyViewController {
    
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if message != nil {
            showAlert(message!)
            message = nil
        }
        idField.becomeFirstResponder()
    }
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        let resetPasswordVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
        resetPasswordVC.backVC = self
        self.navigationController?.pushViewController(resetPasswordVC, animated: true)
    }
    
    @IBAction func register(_ sender: UIButton) {
        let registerVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        registerVC.backVC = self
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        
        guard let email = idField.text, let password = passwordField.text else {
            showAlert(StringMessage.fillAllField)
            return
        }
        backgroundTaskStart()
        FirebaseAccountManager.signIn(id: email, password: password) { [weak self] (message, id) in
            self?.backgroundTaskStop()
            if (id != nil) {
                self?.signIn()
            } else {
                self?.showAlert(message!)
            }
        }
    }
    
    func signIn() {
        print("Signed")
        guard let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController() else {
            showAlert("Sorry, App error!")
            return
        }
        present(viewController, animated: true, completion: nil)
    }
    
}
