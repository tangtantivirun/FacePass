//
//  CheckMemberViewController.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/27/17.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import UIKit
import AWSRekognition

class CheckMemberViewController {
   
    let rekognitionClient = AWSRekognition.default()
    let sourceImage = UIImage(named: "Image.jpg")
    let image = AWSRekognitionImage()
    image!.bytes = UIImageJPEGRepresentation(sourceImage!, 0.7)
    
    guard let request = AWSRekognitionDetectLabelsRequest() else {
        puts("Unable to initialize AWSRekognitionDectLabelsRequest.")
        return
    }
    request.image = image
    request.maxLabels = 3
    request.minConfidence = 90
}
