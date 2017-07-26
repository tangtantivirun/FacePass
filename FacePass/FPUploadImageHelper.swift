//
//  FPUploadImageHelper.swift
//  FacePass
//
//  Created by Jennifer Gao on 25/7/2017.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import AWSCore
import AWSCognito
import AWSS3
class FPUploadImageHelper: NSObject
{
//    static func uploadToS3(){
//        var img: UIImage
//        var url: String
//        var jpeg: Data = UIImageJPEGRepresentation(img, 0.8)!
//        do {
//            try jpeg?.write(to: fileURL)
//        }
//        catch {}
//        
//        let uploadRequest = AWSS3TransferManagerUploadRequest()
//        uploadRequest?.bucket = "facepass-images"
//        uploadRequest?.acl = .publicRead
//        uploadRequest?.key = "image.jpeg"   //name of the file when uploaded
//        uploadRequest?.contentType = "image/jpeg"
//        uploadRequest?.body = URL(fileURLWithPath: url)   //create url
//        
//        let transferManager = AWSS3TransferManager.default()
//        transferManager.upload(uploadRequest!).continueWith(block: { (task: AWSTask<AnyObject>) -> Any? in
//            if let error = task.error {
//                print("Upload failed with error: (\(error.localizedDescription))")
//            }
//            
//            if task.result != nil {
//                let url = AWSS3.default().configuration.endpoint.url
//                let publicURL = url?.appendingPathComponent((uploadRequest?.bucket!)!).appendingPathComponent((uploadRequest?.key!)!)
//                print("Uploaded to:\(publicURL)")
//            }
//            return nil
//        })
//    }
    
    static func saveImageToLibrary(img: UIImage)
    {
        let imageData = UIImageJPEGRepresentation(img, 0.8)
        let compressedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
    }
}
