//
//  Student.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/17/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import Foundation

class Student {
    var imagePath: String!
    var name: String!
    var DoB: Date!
    var className: String!
    var schoolYear: Int!
    var address: String!
    var phoneNumber: String!
    var averagePoint: Float!
    
    init(imagePath: String, name: String, DoB: Date, className: String, schoolYear: Int, address: String, phoneNumber: String, averagePoint: Float) {
        self.imagePath = imagePath
        self.name = name
        self.DoB = DoB
        self.className = className
        self.schoolYear = schoolYear
        self.address = address
        self.phoneNumber = phoneNumber
        self.averagePoint = averagePoint
    }
    
    func toListPropertiesString() -> [String] {
        var list: [String] = []
        list.append(name)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        list.append(dateFormatter.string(from: DoB))
        list.append(className)
        list.append(String(schoolYear))
        list.append(address)
        list.append(phoneNumber)
        list.append(String(averagePoint))
        list.append(imagePath)
        return list
    }
}
