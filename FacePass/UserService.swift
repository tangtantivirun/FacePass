//
//  UserService.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/24/17.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct UserService {

static func create(_ firUser: FIRUser, account: String, completion: @escaping (User?) ->Void){
    let userAttrs = ["account": account]
    
    let ref = Database.database().reference().child("users").child(firUser.uid)
    ref.setValue(userAttrs) { (error, ref) in
        if let error = error {
            assertionFailure(error.localizedDescription)
            return completion(nil)
        }
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let user = User(snapshot: snapshot)
            completion(user)
        })
    }
}
  
}
