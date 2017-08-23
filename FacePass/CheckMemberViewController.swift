//
//  CheckMemberViewController.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/27/17.
//  Copyright © 2017 JT. All rights reserved.
//

//import Foundation
//import UIKit
//import AWSRekognition
//import AWSRekognition.AWSRekognition
//import AWSRekognition.AWSRekognitionModel
//import AWSRekognition.AWSRekognitionResources
//import AWSRekognition.AWSRekognitionService
//import AWSS3
//
//class CheckMemberViewController: UIViewController{
//   
//    func getAWSImage(){
//    let rekognitionClient = AWSRekognition.default()
//    let sourceImage = UIImage(named: "")
//    let image = AWSRekognitionImage()
//    let imageData = UIImageJPEGRepresentation(sourceImage!, 0.7)
//    image?.bytes = imageData
//    
//    guard let request = AWSRekognitionDetectLabelsRequest() else {
//        puts("Unable to initialize AWSRekognitionDetectLabelsRequest.")
//        return
//    }
//    request.image = image
//    request.maxLabels = 3
//    request.minConfidence = 90
//    }
//}
//
//
