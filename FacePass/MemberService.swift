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
import Alamofire
import SwiftyJSON

struct MemberService {
    
    // Parameters: All properties required to create a member instance
    // TODO add params for member name, occupation, age, etc.
    static func create(image: UIImage, name: String, birthday: String, gender: Gender, email: String, phone: String, id: String, completion: @escaping (Member?) ->Void){
        
       
        
        guard let imageData =  UIImageJPEGRepresentation(image,0.8) else {
            fatalError("Image to data conversion failure")
        }
        
        let detectParams = ["api_key":"XWUByShXgb6CConfOR5-T3ORi5CDsJAL",
                          "api_secret":"P5cpB52PnrOBdIZ2jIJpKGco7c4W9Uom",
                          "image_file": imageData] as [String : Any]
        let detectFaces = "https://api-us.faceplusplus.com/facepp/v3/detect"
        
        let addFaces = "https://api-us.faceplusplus.com/facepp/v3/faceset/addface"
        
        
        Alamofire.request(detectFaces, method:.post, parameters: detectParams, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value{
                    let json = JSON(value)
                    print(json["faces"][0]["face_token"].stringValue)
//                    let addFaceParams =
//                        ["api_key":"XWUByShXgb6CConfOR5-T3ORi5CDsJAL",
//                         "api_secret":"P5cpB52PnrOBdIZ2jIJpKGco7c4W9Uom",
//                         "faceset_token": Constants.UserDefaults.account,
//                         "face_tokens": json["faces"][0]["face_token"].stringValue] as [String : Any]
//                    Alamofire.request(addFaces, method:.post, parameters: addFaceParams, encoding: URLEncoding.default).responseJSON { response in
//                        switch response.result {
//                        case .success:
//                            print("upload to faceset")
//                        case .failure(let error):
//                            print(error)
//                        }
//                    }
                }
            case .failure(let error):
                print(error)
            }
        }

        let member = Member(name: name, birthday: birthday, gender: gender, email: email, phone: phone, id: id)
        let reference = Database.database().reference().child("members").child(User.current.uid).child(id)
        let memberID = reference.key
        reference.updateChildValues(member.dictValue)

        
    }
}
