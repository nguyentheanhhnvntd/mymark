
//
//  ResetPasswordViewController.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/22/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import FirebaseAuth

class ResetPasswordViewController: MyViewController {
    
    @IBOutlet weak var emailField: UITextField!
    
    var backVC: SignInViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.becomeFirstResponder()
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetPassword(_ sender: UIButton) {
        let enteredText = emailField.text!
        if !Util.isValidEmail(testStr: enteredText) {
            shakeTextField()
        } else {
            backgroundTaskStart()
            Auth.auth().sendPasswordReset(withEmail: enteredText, completion: {[weak self] (error) in
                self?.backgroundTaskStop()
                if error != nil {
                    self?.showAlert(error!.localizedDescription)
                } else {
                    self?.backVC.message = enteredText + "\n" + StringMessage.checkEmailToGetYourPassword
                    self?.navigationController?.popViewController(animated: true)
                }
            })
        }
        
    }
    
    func shakeTextField() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue.init(cgPoint: CGPoint(x: emailField.center.x - 5,y: emailField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: emailField.center.x + 5, y: emailField.center.y))
        emailField.layer.add(animation, forKey: "position")
    }

}
