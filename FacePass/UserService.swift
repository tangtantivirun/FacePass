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
<<<<<<< HEAD
//    let createCollectionRequest = AWSRekognitionCreateCollectionRequest()
//    createCollectionRequest?.collectionId = "\(account)"
//    AppDelegate.rekognitionClient.createCollection(createCollectionRequest!, completionHandler: { response, error in
//        if let _ = error {
//            print(error!.localizedDescription)
//        }
//    })
=======
    let createCollectionRequest = AWSRekognitionCreateCollectionRequest()
    createCollectionRequest?.collectionId = "\(account)"
    rekognitionClient.createCollection(createCollectionRequest!, completionHandler: { response, error in
        if let _ = error {
            print(error!.localizedDescription)
        }
    })
>>>>>>> a88c118c52209cbc6bbd3ae948b6f62a194ed5e1
    
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
