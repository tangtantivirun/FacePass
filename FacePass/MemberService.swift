//
//  MemberService.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/26/17.
//  Copyright © 2017 JT. All rights reserved.
//

import UIKit
import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct MemberService {
    
   static func create(_ firUser: FIRUser, memberName: String, completion: @escaping (User?) ->Void){
   
    let photoInfo = ["name": memberName]
    let reference  = Database.database().reference().child("Posts").childByAutoId()
    reference.setValue(photoInfo)
    let childautoID = reference.key
    print(childautoID)
}
}
