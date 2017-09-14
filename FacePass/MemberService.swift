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
        
       
        
        guard let imageData = UIImagePNGRepresentation(image) else {
            fatalError("Image to data conversion failure")
        }
        let base64 = imageData.base64EncodedString(options: .endLineWithLineFeed)
        print(base64)
        let apiKey = "XWUByShXgb6CConfOR5-T3ORi5CDsJAL"
        let apiSecret = "P5cpB52PnrOBdIZ2jIJpKGco7c4W9Uom"
//        let detectParams = ["api_key":"XWUByShXgb6CConfOR5-T3ORi5CDsJAL",
//                            "api_secret":"P5cpB52PnrOBdIZ2jIJpKGco7c4W9Uom",
//                          "image_base64":base64] as [String : Any]
        let detectFaces = "https://api-us.faceplusplus.com/facepp/v3/detect"
        
        let addFaces = "https://api-us.faceplusplus.com/facepp/v3/faceset/addface"
        Alamofire.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imageData, withName: "image_file", fileName: name + ".jpeg", mimeType: "image/jpeg")
                
                // Send parameters
                multipartFormData.append(apiKey.data(using: String.Encoding.utf8)!, withName: "api_key")
                multipartFormData.append(apiSecret.data(using: .utf8)!, withName: "api_secret")},
            to: detectFaces,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        debugPrint("SUCCESS RESPONSE: \(response)")
                    }
                case .failure(let encodingError):
                    print("ERROR RESPONSE: \(encodingError)")
                    
                }
        }
        )


//        Alamofire.request(detectFaces, method: .post, parameters: detectParams, encoding: URLEncoding.default).responseJSON { response in
//            switch response.result {
//            case .success:
//                if let value = response.result.value{
//                    //let json = JSON(value)
//                    print("yes!")
//                }
//            case .failure(let error):
//                if let value = response.result.value{
//                   // let json = JSON(value)
//                    print("no!")
//                }
//            }
//        }

        let member = Member(name: name, birthday: birthday, gender: gender, email: email, phone: phone, id: id)
        let reference = Database.database().reference().child("members").child(User.current.uid).child(id)
        let memberID = reference.key
        reference.updateChildValues(member.dictValue)

        
    }
}
