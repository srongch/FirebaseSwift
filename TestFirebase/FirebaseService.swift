//
//  Firebase.swift
//  firebase
//
//  Created by 100456065 on 05/05/2019.
//  Copyright © 2019 100456065. All rights reserved.
//

import Foundation
import Firebase

final class FirebaseService {
    //
    
    var classesRef = Database.database()

    func addUser(user : User,completionHandler: @escaping (_ isError : Bool,_ response : String) -> Void) {
        classesRef.reference(withPath: "Users").childByAutoId().setValue(["name" :user.name,
                                            "profile" : user.profile]) {
                                                (error:Error?, ref:DatabaseReference) in
                                                if let error = error {
                                                    print("Data could not be saved: \(error).")
                                                    completionHandler(true,"Data could not be saved: \(error).")
                                                    
                                                } else {
                                                    print("Data saved successfully!")
                                                  
                                                    completionHandler(false,"Data saved successfully!")
                                                }
        }
    }
        
    func getUser(completionHandler: @escaping (_ isError : Bool, _ users : [User]) -> Void) {

        var userArray = [User]()
        classesRef.reference(withPath: "Users").observeSingleEvent(of: .value, with: { (snapshot) in
            
                    for child in snapshot.children {
                        if let snapshot = child as? DataSnapshot,
                            let model = User(snapshot: snapshot) {
                            userArray.append(model)
                        }
                    }
                    
                    completionHandler(false,userArray)
                }) { (error) in
                    print(error.localizedDescription)
                    completionHandler(true,userArray)
                }
        
    }

}

