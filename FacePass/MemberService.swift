//
//  MemberService.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/26/17.
//  Copyright © 2017 JT. All rights reserved.
//

import UIKit
import Foundation
import AWSCore
import AWSCognito
import AWSS3
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct MemberService {
    
    // Parameters: All properties required to create a member instance
    // TODO add params for member name, occupation, age, etc.
    static func create(image: UIImage, completion: @escaping (Member?) ->Void){
        
        // get unique memberID
        let reference  = Database.database().reference().child("members").child(User.current.uid).childByAutoId()
        let memberID = reference.key
        
        // Eventually implement upload member.dictValue
            //TODO
        
        // Save image to documents on disk and get url
        let diskImageURL = MemberService.save(image, toMember: memberID)
        MemberService.uploadToS3(localImageURL: diskImageURL)
        
        // Do completion
        completion(nil)
    }
    
    // Parameters: Image of new member's face
    // Return value: URL of image saved on disk
    private static func save(_ image: UIImage, toMember memberID: String) -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let destinationURL = documentsDirectory.appendingPathComponent(memberID).appendingPathComponent("image.jpeg")
        let destinationURLString = documentsDirectory.appendingPathComponent(memberID).appendingPathComponent("image.jpeg").absoluteString
        guard let imageData =  UIImageJPEGRepresentation(image,0.8) else {
            fatalError("Image to data conversion failure")
        }
        do {
            try FileManager.default.createFile(atPath: destinationURLString, contents: imageData)
        } catch let error {
            print(error.localizedDescription)
        }
        return destinationURL
}

    private static func uploadToS3(localImageURL url: URL) {
        //        var img: UIImage
        //        var jpeg: Data = UIImageJPEGRepresentation(img, 0.8)!
        //        do {
        //            try jpeg?.write(to: url)
        //        }
        //        catch {}
        
        let uploadRequest = AWSS3TransferManagerUploadRequest()
        uploadRequest?.bucket = "facepass"
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


}
