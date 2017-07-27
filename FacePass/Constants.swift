//
//  Constants.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/24/17.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Segue {
        static let toCreateAccount = "toCreateAccount"
        static let toCreateMember = "toCreateMember"
    }
    
    struct UserDefaults {
        static let currentUser = "currentUser"
        static let uid = "uid"
        static let account = "account"
    }
    
    struct MemberDefaults {
        static let currentMember = "currentMember"
        static let key = "key"
        static let name = "name"
        static let id = "id"
        static let phone = "phone"
        static let email = "email"
        static let gender = "gender"
        static let birthday = "birthday"
    }
    
}
