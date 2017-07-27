//
//  Member.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/26/17.
//  Copyright © 2017 JT. All rights reserved.
//
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class Member:NSObject {
    let  name: String
    let birthday: String
    let gender: Bool
    var email: String
    var phone: String
    let id: String
    let key: String
    
    init(from snapshot: DataSnapshot) {
        
        let snapshotValue = snapshot.value as! [String: Any]
        
        self.name = snapshotValue["name"] as! String
        self.birthday = snapshotValue["birthday"] as! String
        self.gender = snapshotValue["gender"] as! Bool
        self.email = snapshotValue["email"] as! String
        self.phone = snapshotValue["phone"] as! String
        self.id = snapshotValue["id"] as! String
        self.key = snapshot.key
    
}
}
