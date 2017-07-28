//
//  DeveloperAuthenticatedIdentityProvider.swift
//  FacePass
//
//  Created by Jennifer Gao on 28/7/2017.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import AWSCore
import Firebase
import FirebaseAuthUI

class DeveloperAuthenticatedIdentityProvider : AWSCognitoCredentialsProviderHelper {
    override func token() -> AWSTask<NSString> {
        //Write code to call your backend:
        //pass username/password to backend or some sort of token to authenticate user, if successful,
        //from backend call getOpenIdTokenForDeveloperIdentity with logins map containing "your.provider.name":"enduser.username"
        //return the identity id and token to client
        //You can use AWSTaskCompletionSource to do this asynchronously
        
        // Set the identity id and return the token
        return AWSTask(result: "staticToken")
        
    }
    
    override func logins () -> AWSTask<NSDictionary> {
        
        return AWSTask(result: nil)

    }
}
