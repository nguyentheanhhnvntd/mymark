//
//  FirebaseData.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/20/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class FirebaseDataService {
    
    static let subjects = "Subjects"
    static let subject = "Subject"
    static let subjectProperties = ["name", "credit", "point"]
    static let school = "School"
    static let schoolImage = "School.png"
    static let studentImage = "Student.png"
    static let schoolProperties = ["name", "address", "phoneNum", "group", "description", "imageUrl"]
    static let student = "Student"
    static let studentProperties = ["name", "DoB", "class", "schoolYear", "address", "phoneNum", "averagePoint", "imageUrl"]
    
    static func clearAllDatabase() {
        Database.database().reference().removeValue()
    }
    
    static func userEmail() -> String {
        var userEmail = (Auth.auth().currentUser?.email)!
        userEmail = userEmail.replacingOccurrences(of: "@", with: ">>")
        userEmail = userEmail.replacingOccurrences(of: ".", with: "<>")
        return userEmail
    }
    
    static func saveSubject(subject: Subject) {
        print((Auth.auth().currentUser?.email)!)
        let userEmail = self.userEmail()
        let ref = Database.database().reference()
        ref.child(userEmail).child(self.subjects).child(subject.name).setValue(
            [subjectProperties[1]: subject.credits,
             subjectProperties[2]: subject.finalPoint.pointTen])
    }
    
    static func save(object: AnyObject, completion: @escaping(_ message: String?) -> Void) {
        let userEmail = self.userEmail()
        var student = false
        
        if object is Student {
            student = true
        } else if object is School {
            student = false
        }
        
        if let imageUpload = UIImagePNGRepresentation(UIImage(named: student ? "stui.jpg" : "schi.png")!) {
            print(imageUpload.count)
            let storageRef = Storage.storage().reference()
            storageRef.child(userEmail).child(student ? self.studentImage : self.schoolImage).putData(imageUpload, metadata: nil, completion: {
                (metadata, error) in
                if error != nil {
                    completion(error?.localizedDescription)
                }
                else if let imageUrl = metadata?.downloadURL()?.absoluteString {
                    if let school = object as? School {
                        school.imagePath = imageUrl
                        print(school.imagePath)
                        self.saveSchool(propertiesList: school.toListPropertiesString())
                    } else if let student = object as? Student {
                        student.imagePath = imageUrl
                        print(student.imagePath)
                        self.saveStudent(propertiesList: student.toListPropertiesString())
                    }
                    completion(nil)
                }
            })
        }
    }
    
    private static func saveStudent(propertiesList: [String]) {
        let ref = Database.database().reference()
        let userEmail = self.userEmail()
        for i in 0..<studentProperties.count {
            ref.child(userEmail).child(self.student).child(self.studentProperties[i]).setValue(propertiesList[i])
        }
    }
    
    private static func saveSchool(propertiesList: [String]) {
        let ref = Database.database().reference()
        let userEmail = self.userEmail()
        ref.child(userEmail).child(self.school).removeValue()
        for i in 0..<schoolProperties.count {
            ref.child(userEmail).child(self.school).child(self.schoolProperties[i]).setValue(propertiesList[i])
        }
    }
}
