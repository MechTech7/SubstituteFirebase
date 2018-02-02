//
//  SchoolQuery.swift
//  SubstituteFirebase
//
//  Created by Mason Llewellyn on 2/2/18.
//  Copyright © 2018 Mason Llewellyn. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class TeacherQuery: NSObject{
    var ref = DatabaseReference()
    init(in_ref: DatabaseReference){
        ref = in_ref
    }
    func get_satisfying(key: String, value: String) -> DataSnapshot{
        var op = DataSnapshot()
        ref.observe(.value, with: { snapshot in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let k = snap.childSnapshot(forPath: key)
                if k.value! as! String == value{
                    op = snap
                    print(snap.value!)
                }
                
            }
        });
        return op
    }
}
