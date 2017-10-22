//
//  Point.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/16/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import Foundation

class FinalPoint {
    
    var pointTen: Float!
    
    var pointFour: Float!
    
    var pointC: String!
    
    init(pointTen: Float) {
        self.pointTen = pointTen
        setPoint4AndPointC(point10: pointTen)
    }
    
    init(listPoint: [Point]){
        pointTen = 0
        for point in listPoint {
            pointTen = point.mark + pointTen
        }
        setPoint4AndPointC(point10: pointTen)
    }
    
    private func setPoint4AndPointC(point10: Float) {
        if point10 >= 9.0 {
            pointFour = 4.0
            pointC = "A+"
        } else if point10 >= 8.5 {
            pointFour = 3.7
            pointC = "A"
        } else if point10 >= 8.0 {
            pointFour = 3.5
            pointC = "B+"
        } else if point10 >= 7.0 {
            pointFour = 3.0
            pointC = "B"
        } else if point10 >= 6.5 {
            pointFour = 2.5
            pointC = "C+"
        } else if point10 >= 5.5 {
            pointFour = 2.0
            pointC = "C"
        } else if point10 >= 5.0 {
            pointFour = 1.5
            pointC = "D+"
        } else if point10 >= 4.0 {
            pointFour = 1.0
            pointC = "D"
        } else {
            pointFour = 0
            pointC = "F"
        }
    }
}
