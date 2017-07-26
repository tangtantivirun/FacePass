//
//  Member.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/26/17.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class Member: NSObject {
    
    let uid: String
    let memberName: String
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.MemberDefaults.uid) as? String,
            let memberName = aDecoder.decodeObject(forKey: Constants.MemberDefaults.memberName) as? String
            else { return nil }
        self.uid = uid
        self.memberName = memberName
    
        super.init()
    }
    
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any],
            let memberName = dict ["memberName"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.memberName = memberName
        super.init()
    }
    
    init(uid: String, memberName: String) {
        self.uid = uid
        self.memberName = memberName
        super.init()
    }
    private static var _current: Member?
    static var current: Member {
        guard let currentMember = _current else {
            fatalError("Error: current member doesn't exist")
        }
        return currentMember
    }
    
    class func setCurrent(_ member: Member, writeToMemberDefaults: Bool = false) {
        if writeToMemberDefaults {
            let data = NSKeyedArchiver.archivedData(withRootObject: member.self)
            MemberDefaults.standard.set(data, forKey: Constants.MemberDefaults.currentMember)
        }
        _current = Member
    }
}
extension Member: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.MemberDefaults.uid)
        aCoder.encode(memberName, forKey: Constants.MemberDefaults.memberName)
    
}
}
