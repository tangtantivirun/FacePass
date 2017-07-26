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
    static func uploadToS3(url: NSString){
//        var img: UIImage
//        var jpeg: Data = UIImageJPEGRepresentation(img, 0.8)!
//        do {
//            try jpeg?.write(to: url)
//        }
//        catch {}
        
        let uploadRequest = AWSS3TransferManagerUploadRequest()
        uploadRequest?.bucket = "facepass-images"
        uploadRequest?.acl = .publicRead
        uploadRequest?.key = "image.jpeg"   //name of the file when uploaded
        uploadRequest?.contentType = "image/jpeg"
        uploadRequest?.body = URL(fileURLWithPath: url as String)   //create url
        
        let transferManager = AWSS3TransferManager.default()
        transferManager.upload(uploadRequest!).continueWith(block: { (task: AWSTask<AnyObject>) -> Any? in
            if let error = task.error {
                print("Upload failed with error: (\(error.localizedDescription))")
            }
            
            if task.result != nil {
                print("we did it!")
//                let url = AWSS3.default().configuration.endpoint.url
//                let publicURL = url?.appendingPathComponent((uploadRequest?.bucket!)!).appendingPathComponent((uploadRequest?.key!)!)
               // print("Uploaded to:\(publicURL ?? <#default value#>)")
            }
            return nil
        })
    }
    
    static func saveImageToLibrary(img: UIImage) -> String
    {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        let destinationPath = documentsPath.appendingPathComponent("filename.jpg")
        let image =  UIImageJPEGRepresentation(img,0.8) as NSData!
        image?.write(toFile: destinationPath, atomically: true)
        return destinationPath
    }
}
