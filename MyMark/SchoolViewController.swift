//
//  SchoolViewController.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/17/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class SchoolViewController: MyViewController {
    
    @IBOutlet weak var intro: UILabel!
    @IBOutlet weak var group: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var school: School!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        school = FileIO.readSchool()
        setInfoToView()
        backgroundTaskStart()
        FirebaseDataService.save(object: school) { [weak self]
            (errorMessage) in
            self?.backgroundTaskStop()
            if errorMessage != nil {
                self?.showAlert(errorMessage!)
            }
        }
    }
    
    func setInfoToView() {
        image = UIImageView(image: UIImage(named: "schi.png")!)
        name.text = school.name
        address.text = school.address
        phone.text = String(school.phoneNumber)
        group.text = school.group
        intro.text = school.intro
    }
    
}
