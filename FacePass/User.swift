//
//  User.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/24/17.
//  Copyright © 2017 JT. All rights reserved.
//
import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User: NSObject {
    
    let uid: String
    let account: String
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let account = aDecoder.decodeObject(forKey: Constants.UserDefaults.account) as? String
            else { return nil }
        self.uid = uid
        self.account = account
        
        super.init()
    }
    
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any],
            let account = dict ["account"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.account = account
        super.init()
    }
    
    init(uid: String, account: String) {
        self.uid = uid
        self.account = account
        super.init()
    }
    private static var _current: User?
    static var current: User {
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        return currentUser
    }
    
    class func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        if writeToUserDefaults {
            let data = NSKeyedArchiver.archivedData(withRootObject: user.self)
            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentAccount)
        }
        _current = user
    }
}
extension User: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.UserDefaults.uid)
        aCoder.encode(account, forKey: Constants.UserDefaults.account)
    }
}
