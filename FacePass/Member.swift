//
//  Member.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/26/17.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class Member: NSObject {
    
    func retrieveUserEmail(userName : String, completionBlock : ((_ userEmail : String) -> Void)){
    var userEmail : String!
    
    Database.database().reference().child("usernameEmailLink (userName)").observeSingleEvent(of: .value, with: {(snap) in
        
        
        userEmail = snap.value!
    })
        
    print(userEmail)
}
}
