//
//  Point.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/17/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import Foundation

class Point {
    
    var point: Float!
    var percent: Int!
    
    var mark: Float! {
        return point * Float(percent) / 100
    }
    
    init(point: Float, percent: Int) {
        self.point = point
        self.percent = percent
    }
    
}
