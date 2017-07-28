//
//  UserService.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/24/17.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import AWSRekognition
import AWSCognito
import AWSCore
import AWSS3
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct UserService {

static func create(_ firUser: FIRUser, account: String, completion: @escaping (User?) ->Void){
    let userAttrs = ["account": account]
    let createCollectionRequest = AWSRekognitionCreateCollectionRequest()
    createCollectionRequest?.collectionId = "\(account)"
    
<<<<<<< HEAD
    rekognitionClient.createCollection(createCollectionRequest!, completionHandler: { response, error in
        if let _ = error {
            print(error!.localizedDescription)
        }
    })
=======
    AppDelegate.rekognitionClient.createCollection(createCollectionRequest!)
>>>>>>> 61aa5da6e6b981af2621b2fbc1d7895366ae0589
    
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
