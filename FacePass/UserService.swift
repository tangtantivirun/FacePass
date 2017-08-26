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
import Alamofire

struct UserService {

static func create(_ firUser: FIRUser, account: String, completion: @escaping (User?) ->Void){
    let userAttrs = ["company name": account]
    let parameters = ["api-key":"XWUByShXgb6CConfOR5-T3ORi5CDsJAL",
                      "api_secret": "P5cpB52PnrOBdIZ2jIJpKGco7c4W9Uom",
                      "display_name": account] as [String : Any]
    let apiToContact = "https://api-us.faceplusplus.com/facepp/v3/faceset/create"
    Alamofire.request(apiToContact, method:.post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
        switch response.result {
        case .success:
            if let value = response.result.value {
<<<<<<< HEAD
=======
              
                
                // Do what you need to with JSON here!
                // The rest is all boiler plate code you'll use for API requests
                
                
            }
        case .failure(let error):
            print(error)
        }
    }

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
