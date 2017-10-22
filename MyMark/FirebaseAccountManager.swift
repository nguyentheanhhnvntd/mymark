//
//  FireBaseAccountManager.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/20/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseAccountManager {
    
    static func sendEmailVerification(completion: @escaping (_ error: Error?) -> Void) {
        /** @fn sendEmailVerificationWithCompletion:
         @brief Initiates email verification for the user.
         
         @param completion Optionally; the block invoked when the request to send an email verification
         is complete, or fails. Invoked asynchronously on the main thread in the future.
         
         @remarks Possible error codes:
         <ul>
         <li>@c FIRAuthErrorCodeInvalidRecipientEmail - Indicates an invalid recipient email was
         sent in the request.
         </li>
         <li>@c FIRAuthErrorCodeInvalidSender - Indicates an invalid sender email is set in
         the console for this action.
         </li>
         <li>@c FIRAuthErrorCodeInvalidMessagePayload - Indicates an invalid email template for
         sending update email.
         </li>
         <li>@c FIRAuthErrorCodeUserNotFound - Indicates the user account was not found.</li>
         </ul>
         
         @remarks See @c FIRAuthErrors for a list of error codes that are common to all FIRUser methods.
         */
        
        
        Auth.auth().currentUser?.sendEmailVerification { (error) in
            if error != nil {
                completion(error)
            }
        }
        
        completion(nil)
    }
    
    static func register(email: String, password: String, completion: @escaping (_ errorMessage: String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let _ = user else {
                if let error = error {
                    completion("\(error.localizedDescription)")
                    return
                }
                completion(StringMessage.unknowError)
                return
            }
            completion(nil)
        }
    }
    
    static func signOut(completion: @escaping (_ errorMessage: String?) -> Void) {
        do {
            try Auth.auth().signOut()
            print("sign out")
            completion(nil)
        } catch let error {
            print("\(error) Error")
            completion(error.localizedDescription)
        }
    }
    
    static func signIn( id: String, password: String, completion: @escaping (_ errorMessage: String?, _ id: String?) -> Void) {
        Auth.auth().signIn(withEmail: id, password: password, completion: {
            (user, error) in
            if user == nil {
                if let error = error {
                    completion("\(error.localizedDescription)", nil)
                    return
                }
                completion(StringMessage.unknowError, nil)
                return
            }
            if !user!.isEmailVerified {
                completion(StringMessage.verifyYourEmail, nil)
            } else {
                completion(nil, id)
            }
        })
    }
    
}
