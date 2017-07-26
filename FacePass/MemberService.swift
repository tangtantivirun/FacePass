//
//  MemberService.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/26/17.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct MemberService {
    
    static func create(_ firUser: FIRUser, memberName: String, completion: @escaping (Member?) ->Void){
        let memberAttrs = ["memberName": memberName]
        
        let ref = Database.database().reference().child("members").child(firUser.uid)
        ref.setValue(memberAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let member = Member(snapshot: snapshot)
                completion(member)
            })
        }
    }
}
