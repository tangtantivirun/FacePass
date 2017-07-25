//
//  AddNewMemberViewController.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/25/17.
//  Copyright © 2017 JT. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class AddNewMemberViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var captureSession: AVCaptureSession?
    var photoOutput : AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    @IBOutlet weak var cameraView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        var backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        var error : NSError?
        let input = AVCaptureDeviceInput()
        
        if error == nil && (captureSession?.canAddInput(input))!{
            
            captureSession?.addInput(input)
            
            photoOutput = AVCapturePhotoOutput()
            
            if (captureSession?.canAddOutput(photoOutput))!{
                captureSession?.addOutput(photoOutput)
                
                previewLayer = AVCaptureVideoPreviewLayer(session:captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                cameraView.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
            }
        }
    }
}
