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
        let detectParams = ["api_key":"XWUByShXgb6CConfOR5-T3ORi5CDsJAL",
                            "api_secret":"P5cpB52PnrOBdIZ2jIJpKGco7c4W9Uom",
                          "image_base64":base64] as [String : Any]
        let detectFaces = "https://api-us.faceplusplus.com/facepp/v3/detect"
        
        //let addFaces = "https://api-us.faceplusplus.com/facepp/v3/faceset/addface"
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                // Here is where things would change for you
                // With name is the thing between the $files, and filename is the temp name.
                // Make sure mimeType is the same as the type of imagedata you made!
                multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
        },
            to: "https://api-us.faceplusplus.com/facepp/v3/detect",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let result = response.result.value {
                            // Get the json response. From this, we can get all things we send back to the app.
                            let JSON = result as! NSDictionary
                            debugPrint(response)
                        }
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
        }
        )

        Alamofire.request(detectFaces, method: .post, parameters: detectParams, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value{
                    //let json = JSON(value)
                    print("yes!")
                }
            case .failure(let error):
                if let value = response.result.value{
                   // let json = JSON(value)
                    print("no!")
                }
            }
        }

        let member = Member(name: name, birthday: birthday, gender: gender, email: email, phone: phone, id: id)
        let reference = Database.database().reference().child("members").child(User.current.uid).child(id)
        let memberID = reference.key
        reference.updateChildValues(member.dictValue)

        
    }
}
