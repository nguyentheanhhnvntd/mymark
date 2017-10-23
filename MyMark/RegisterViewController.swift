//
//  RegisterViewController.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/21/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class RegisterViewController: MyViewController {
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!

    var backVC: SignInViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.becomeFirstResponder()
    }
    
    func checkField() -> String? {
        
        let email = emailField.text!
        let password = passwordField.text!
        let confirmPassword = confirmPasswordField.text!
        
        if email.characters.count == 0 || password.characters.count == 0 || confirmPassword.characters.count == 0 {
            return StringMessage.fillAllField
        }
        if password != confirmPassword {
            return (StringMessage.confirmPasswordNotMatch)
        }
        if !Util.isValidEmail(testStr: email) {
            return (StringMessage.emailFormatError)
        }
        return nil
    }
    
    @IBAction func registerUser(_ sender: UIButton) {
        
        let errorMessage = checkField()
        if errorMessage != nil {
            showAlert(errorMessage!)
            return
        }
        
        let email = emailField.text!
        let password = passwordField.text!
        
        backgroundTaskStart()
        
        FirebaseAccountManagerService.register(email: email, password: password) { [weak self] (message) in
            self?.backgroundTaskStop()
            if message != nil {
                self?.showAlert(message!)
            } else {
                FirebaseAccountManagerService.sendEmailVerification(completion: { (error) in
                    if error != nil {
                        self?.backVC.message = error!.localizedDescription
                    }else {
                        self?.backVC.message = StringMessage.verifyYourEmail
                    }
                    self?.navigationController?.popViewController(animated: true)
                })
            }
            
        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
