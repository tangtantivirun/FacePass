//
//  FaceDetectionViewController.swift
//  FacePass
//
//  Created by Jennifer Gao on 24/7/2017.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import UIKit
import AWSRekognition
import AWSCore

class FaceDetectionViewController: UIViewController
{
   // var rekognitionClient:AWSRekognition!
    //var photoHelper = FPPhotohelper()
    
   
        let photoHelper = FPPhotoHelper()
        override func viewDidLoad() {
            super.viewDidLoad()
            photoHelper.completionHandler = { image in
                UploadService.create(for:image)
            }
            
            delegate = self
            tabBar.unselectedItemTintColor = .black
        }
    }

       // rekognitionClient = AWSRekognition.default()
        //photoHelper.presentImagePickerController(from: self)



