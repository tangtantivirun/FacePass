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

class FaceDetectionViewController
{
    var rekognitionClient:AWSRekognition!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        rekognitionClient = AWSRekognition.default()
    }
}
