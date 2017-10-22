//
//  Subject.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/16/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import Foundation

class Subject {
    
    var name: String!
    var credits: Int!
    var listPoint: [Point]!
    
    var finalPoint: FinalPoint!
    //        return FinalPoint(listPoint: listPoint)
    
    init(name: String, credits: Int, finalPoint: FinalPoint) {
        self.name = name
        self.credits = credits
        self.finalPoint = finalPoint
        fakeListPoint()
    }
    
    func fakeListPoint() {
        
        let percent1 = 10
        let percent4 = 30 + Int(arc4random_uniform(20))
        let percent3 = 10 + Int(arc4random_uniform(20))
        let percent2 = 100 - percent1 - percent3 - percent4
        
        let point1 = 40 + 5 * Int(arc4random_uniform(12))
        let point2 = 40 + 5 * Int(arc4random_uniform(12))
        let point3 = 40 + 5 * Int(arc4random_uniform(12))
        let point4 = 40 + 5 * Int(arc4random_uniform(12))
        
        listPoint = []
        listPoint.append(Point(point: Float(point1)/10, percent: percent1))
        listPoint.append(Point(point: Float(point2)/10, percent: percent2))
        listPoint.append(Point(point: Float(point3)/10, percent: percent3))
        listPoint.append(Point(point: Float(point4)/10, percent: percent4))
        
    }
}
