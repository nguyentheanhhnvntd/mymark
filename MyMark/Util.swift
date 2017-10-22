//
//  Util.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/18/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import Foundation

class Util {
    
    public static func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    public static func search( searchText: String, listResult: [String]) -> [String] {
        
        var result: [String] = []
        
        let listChar = [Character](searchText.characters)
        
        for ableResult in listResult {
            var i = 0
            let resultChar = [Character](ableResult.characters)
            
            for j in 0 ..< resultChar.count {
                
                if listChar.count - i > resultChar.count - j {
                    break
                }
                
                if listChar[i] == resultChar[j] {
                    i += 1
                }
                
                if i == listChar.count {
                    result.append(ableResult)
                    break
                }
            }
            
        }
        
        return result
    }
}
