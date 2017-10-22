//
//  School.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/17/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import Foundation

class School {
    
    var imagePath: String!
    var name: String!
    var address: String!
    var phoneNumber: String!
    var group: String!
    var intro: String!
    
    init(imagePath: String, name: String, address: String, phoneNumber: String, group: String, intro: String) {
        self.imagePath = imagePath
        self.name = name
        self.address = address
        self.phoneNumber = phoneNumber
        self.group = group
        self.intro = intro
        
    }
}
