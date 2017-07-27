//
//  MemberService.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/26/17.
//  Copyright © 2017 JT. All rights reserved.
//

import UIKit
import Foundation
import AWSCore
import AWSCognito
import AWSS3
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct MemberService {
    
    // Parameters: All properties required to create a member instance
    // TODO add params for member name, occupation, age, etc.
    static func create(image: UIImage, name: String, birthday: String, gender: Bool, email: String, phone: String, id: String, completion: @escaping (Member?) ->Void){
        
        guard let imageData =  UIImageJPEGRepresentation(image,0.8) else {
            fatalError("Image to data conversion failure")
        }
        
        // get unique memberID
        //let reference  = Database.database().reference().child("members").child(User.current.uid).childByAutoId()
        //let memberID = reference.key
       
        // Eventually implement upload member.dictValue
        let userAttrs: [String: Any] = ["name": name,
                                        "birthday": birthday,
                                        "gender" : gender,
                                        "email" : email,
                                        "phone" : phone,
                                        "id" : id]
        
            //TODO
        
        
        let transferUtility = AWSS3TransferUtility.default()
        let expression = AWSS3TransferUtilityUploadExpression()
        
        transferUtility.uploadData(
            imageData,
            bucket: "facepass-lasthope",
            key: "\(id)/image.jpeg",
            contentType: "image/jpeg",
            expression: expression).continueWith(block: { task in
                if let error = task.error {
                    print(error.localizedDescription)
                    return completion(nil)
                }
                // Create new member and send back through completion handler
                return nil
            })
    }
}
