//
//  ViewController.swift
//  TestFirebase
//
//  Created by 100456065 on 05/05/2019.
//  Copyright © 2019 100456065. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 //   let firebase = FirebaseService.init()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let user = User(name: "Demo", profile: "user profile.")
        textField.text = "Name : \(user.name) & Profile : \(user.profile)"
        
        self.saveToFirebase(user: user)
        self.getFromFirebase()
        
    }

    func saveToFirebase(user : User){
        
        FirebaseService().addUser(user: user, completionHandler: { error, reponse  in
            print("done")
        })
    }
    
    func getFromFirebase(){
        FirebaseService().getUser { isError, users in
            
            if isError {
                print("error retrieving data.")
            }else{
                print(users)
                var text = ""
                users.forEach({ user in
                    
                   text = "\(text) Name : \(user.name) & Profile : \(user.profile)\n"
                   
                })
                 self.textView.text = text
            }
            
            
        }
    }

}

