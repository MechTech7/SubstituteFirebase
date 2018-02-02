//
//  ViewController.swift
//  SubstituteFirebase
//
//  Created by Mason Llewellyn on 1/24/18.
//  Copyright © 2018 Mason Llewellyn. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
//TODO: build class to search database for teachers, substiturtes 
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ref = DatabaseReference()
        Auth.auth().signIn(withEmail: "masontyler747@gmail.com", password: "test123") { (user, error) in
        }

        let usersRef = Database.database().reference(withPath: "online")
        ref = Database.database().reference(withPath: "events")
        let tq = TeacherQuery(in_ref: ref)
        let a = tq.get_satisfying(key: "teacher", value: "PablitoLake")
        print("ouput: ")
        print(a.value)
        /*ref.observe(.value, with: { snapshot in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let teacher = snap.childSnapshot(forPath: "teacher").value as! String
                if(teacher == "PablitoLake"){
                    print(snap.value)
                }
                
            }
        });*/
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

