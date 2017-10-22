//
//  StudentViewController.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/17/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {

    @IBOutlet weak var averagePoint: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var schoolYear: UILabel!
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var DoB: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var student: Student!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        student = FileIO.readStudent()
        setInfoToView()
    }
    
    func setInfoToView() {
        let imageX = UIImage(named: "stui.jpg")
        image = UIImageView(image: imageX)
    
        name.text = student.name
        
        let dob = DateFormatter.localizedString(from: student.DoB, dateStyle: .medium, timeStyle: .none)
        
        DoB.text = dob
        className.text = student.className
        schoolYear.text = String(student.schoolYear)
        address.text = student.address
        phone.text = String(student.phoneNumber)
        averagePoint.text = String(student.averagePoint)
    }
}
