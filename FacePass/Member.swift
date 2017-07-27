//
//  Member.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/26/17.
//  Copyright © 2017 JT. All rights reserved.
//
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class Member:NSObject {
    let name: String
    let birthday: String
    let gender: Gender
    var email: String
    var phone: String
    let id: String
    let key: String
    private static var _current: Member?
    static var current: Member {
        // 3
        guard let currentMember = _current else {
            fatalError("Error: current user doesn't exist")
        }
        
        // 4
        return currentMember
    }
    var dictValue: [String: String] {
        let memberAttrs = ["name": name,
                            "birthday": birthday,
                            "gender" : gender.rawValue,
                            "email" : email,
                            "phone" : phone,
                            Constants.MemberDefaults.id : id]
        return memberAttrs
    }
    
    init?(from snapshot: DataSnapshot) {
        
        let snapshotValue = snapshot.value as! [String: String]
        // DO ERROR CHECKING!
        
        guard let dict = snapshot.value as? [String: String],
            let name = dict[Constants.MemberDefaults.name],
            let birthday = dict[Constants.MemberDefaults.birthday],
            let gender = dict[Constants.MemberDefaults.gender],
            let email = dict[Constants.MemberDefaults.email],
            let phone = dict[Constants.MemberDefaults.phone],
            let id = dict[Constants.MemberDefaults.id]
            else {
                return nil
        }
        self.name = snapshotValue[name]!
        self.birthday = snapshotValue[birthday]!
        self.email = snapshotValue[email]!
        self.phone = snapshotValue[phone]!
        self.id = snapshotValue[id]!
        self.gender = Gender.init(rawValue: snapshotValue[gender]!)!
        self.key = snapshot.key
    }

    init(name: String, birthday: String, gender: Gender, email: String, phone: String, id: String) {
        self.name = name
        self.birthday = birthday
        self.gender = gender
        self.email = email
        self.phone = phone
        self.id = id
        key = ""
    }
    
    class func setCurrent(_ member: Member, writeToMemberDefaults: Bool = false) {
        // 2
        if writeToMemberDefaults {
            // 3
            let data = NSKeyedArchiver.archivedData(withRootObject: member)
            
            // 4
            UserDefaults.standard.set(data, forKey: Constants.MemberDefaults.currentMember)
        }
        
        _current = member
    }
    
}

enum Gender: String {
    case Male = "male"
    case Female = "female"
    case Other = "other"
}
