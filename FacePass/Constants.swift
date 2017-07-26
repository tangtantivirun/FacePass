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
        static let uid = "uid"
        static let memberName = "memberName"
}
}
