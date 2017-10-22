//
//  SubjectIO.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/17/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import Foundation

class FileIO {
    
    public static let filePath = "/Users/theanhnguyen/XcodeProject/MyMark/MyMark"
    static let subjectFileName = "Subject"
    static let schoolFileName = "School"
    static let studentFileName = "Student"
    
    static let studentImageName = "studentImage.jpg"
    static let schoolImageName = "schoolImage.png"
    
    static func readSubjects() -> [Subject] {
        
        let file = filePath + "/" + subjectFileName
        let fileContent = try! NSString(contentsOfFile: file, encoding: String.Encoding.utf8.rawValue) as String
        let listLine = fileContent.components(separatedBy: "\n")
        
        var listSubject: [Subject] = []
        
        for line in listLine {
            let subjectFeature = line.components(separatedBy: " - ")
            if subjectFeature.count != 3 {
                break
            }
            let name = subjectFeature[0]
            let credits = Int(subjectFeature[1])!
            let pointTen = Float(subjectFeature[2])!
            let finalPoint = FinalPoint(pointTen: pointTen)
            let subject = Subject(name: name, credits: credits, finalPoint: finalPoint)
            listSubject.append(subject)
        }
        return listSubject
    }

    static func readSchool() -> School? {
        
        let file = filePath + "/" + schoolFileName
        let fileContent = try! NSString(contentsOfFile: file, encoding: String.Encoding.utf8.rawValue) as String
        let listLine = fileContent.components(separatedBy: "\n")
        
        guard listLine.count == 6 else {
            return nil
        }
        
        let school = School(imagePath: filePath + "/" + schoolImageName, name: listLine[0], address: listLine[1], phoneNumber: listLine[2], group: listLine[3], intro: listLine[4])
       
        return school
    }
    
    static func readStudent() -> Student? {
        
        let file = filePath + "/" + studentFileName
        let fileContent = try! NSString(contentsOfFile: file, encoding: String.Encoding.utf8.rawValue) as String
        let listLine = fileContent.components(separatedBy: "\n")
        
        guard listLine.count == 8 else {
            print("Read student listline error: " + String(listLine.count))
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        guard let DoB = formatter.date(from: listLine[1]) else {
            print("Read student DoB error: " + listLine[1])
            return nil
        }
        
        let student = Student.init(imagePath: filePath + "/" + studentImageName, name: listLine[0], DoB: DoB, className: listLine[2], schoolYear: Int(listLine[3])!, address: listLine[4], phoneNumber: listLine[5], averagePoint: Float(listLine[6])!)
        
        return student
    }
}
