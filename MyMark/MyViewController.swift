//
//  MyViewController.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/22/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    var activityIndicator: UIActivityIndicatorView!
    
    var blurEffectView: UIVisualEffectView!
    
    func setUp() {
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(activityIndicator)
    }
    
    func backgroundTaskStart() {
        activityIndicator.startAnimating()
        view.addSubview(blurEffectView)
        view.bringSubview(toFront: activityIndicator)
    }
    
    func backgroundTaskStop() {
        activityIndicator.stopAnimating()
        blurEffectView.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
}
