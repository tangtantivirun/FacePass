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
    static func uploadToS3(url: URL){
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
        uploadRequest?.body = url
        print("we made it half way")
        
        
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
    
    static func saveImageToLibrary(img: UIImage) -> URL
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let destinationURL = documentsDirectory.appendingPathComponent("image.jpeg")
        guard let imageData =  UIImageJPEGRepresentation(img,0.8) else {
            fatalError("Image to data conversion failure")
        }
        try? imageData.write(to: destinationURL)
        return destinationURL
    }
}
