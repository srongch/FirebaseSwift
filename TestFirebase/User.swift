//
//  User.swift
//  firebase
//
//  Created by 100456065 on 05/05/2019.
//  Copyright © 2019 100456065. All rights reserved.
//

import Foundation
import Firebase

struct User : UserProtocol {
    var name: String
    
    var profile: String

    init(name: String, profile : String){
        self.name = name
        self.profile = profile
    }
    
    init?(snapshot: DataSnapshot) {
        guard  let value = snapshot.value as? [String:AnyObject],
               let name = value["name"] as? String,
               let profile = value["profile"] as? String else {
            
                print("no value")
            return nil
        }
        self.name = name
        self.profile = profile
    }
    
}
