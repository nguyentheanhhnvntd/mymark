//
//  SubjectInfoDialog.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/16/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class SubjectInfoDialog: UIViewController {
    
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var mark4: UILabel!
    @IBOutlet weak var mark3: UILabel!
    @IBOutlet weak var mark2: UILabel!
    @IBOutlet weak var mark1: UILabel!
    @IBOutlet weak var percent4: UILabel!
    @IBOutlet weak var percent3: UILabel!
    @IBOutlet weak var percent2: UILabel!
    @IBOutlet weak var percent1: UILabel!
    @IBOutlet weak var done: UIButton!
    
    var subject: Subject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubjectInfo()
        done.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)
    }
    
    func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func setSubjectInfo() {
        
        if subject == nil {
            print("nil subject")
            return
        }
        guard let listPoint = subject.listPoint else {
            print("nil listPoint")
            return
        }
        
        subjectName.text = subject.name
        percent1.text = String(listPoint[0].percent) + "%"
        percent2.text = String(listPoint[1].percent) + "%"
        percent3.text = String(listPoint[2].percent) + "%"
        percent4.text = String(listPoint[3].percent) + "%"
        
        mark1.text = String(listPoint[0].point)
        mark2.text = String(listPoint[1].point)
        mark3.text = String(listPoint[2].point)
        mark4.text = String(listPoint[3].point)
    }
}
