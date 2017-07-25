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
import AWSCognito
import AWSS3
import SwiftyJSON

class FaceDetectionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    let photoHelper = FPPhotoHelper()
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.USWest2,
                                                                identityPoolId:"us-west-2:793194f6-6dd2-4fcb-ace9-b7f636836540")
        
        let configuration = AWSServiceConfiguration(region:.USWest2, credentialsProvider:credentialsProvider)
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        let S3BucketName = "facepass-images"
        let ext = "jpeg"
        let localFileName = "test-image"
        let remoteName = localFileName + "." + ext
        
        let uploadRequest! = AWSS3TransferManagerUploadRequest()
        uploadRequest.body = generateImageUrl(remoteName)
        uploadRequest.key = remoteName
        uploadRequest.bucket = S3BucketName
        uploadRequest.contentType = "image/jpeg"
        
        let transferManager = AWSS3TransferManager.default()
        
        // Perform file upload
        transferManager.upload(uploadRequest).continueWithBlock { (task) -> AnyObject! in
            
            dispatch_async(dispatch_get_main_queue()) {
                self.myActivityIndicator.stopAnimating()
            }
            
            if let error = task.error {
                print("Upload failed with error: (\(error.localizedDescription))")
            }
            
            if let exception = task.exception {
                print("Upload failed with exception (\(exception))")
            }
            
            if task.result != nil {
                
                let s3URL = NSURL(string: "https://s3.amazonaws.com/\(S3BucketName)/\(uploadRequest.key!)")!
                print("Uploaded to:\n\(s3URL)")   //fetch URL of storage
                // Remove locally stored file
                self.remoteImageWithUrl(uploadRequest.key!)
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.displayAlertMessage()
                }
                
                
            }
            else {
                print("Unexpected empty result.")
            }
            return nil
        }
    }
}

// rekognitionClient = AWSRekognition.default()
//photoHelper.presentImagePickerController(from: self)
