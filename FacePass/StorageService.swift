//
//  StorageService.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/25/17.
//  Copyright © 2017 JT. All rights reserved.
//

import UIKit
import FirebaseStorage

struct StorageService {
    static func uploadImage(_image:UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
        guard let imageData = UIImageJPEGRepresentation(_image, 0.1) else {
            return completion(nil)
        }
        reference.putData(imageData, metadata: nil, completion: { (metadata, error) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            completion(metadata?.downloadURL())
        })
    }
}
