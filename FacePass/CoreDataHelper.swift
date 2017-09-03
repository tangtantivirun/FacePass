//
//  CoreDataHelper.swift
//  FacePass
//
//  Created by Tang Tantivirun on 9/1/17.
//  Copyright © 2017 JT. All rights reserved.
//

import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    
    
    static func newMember () -> Member {
        let member = NSEntityDescription.insertNewObject (forEntityName: "Member" , into: managedContext) as! Member
        return member
    }
    static func saveMember (){
        do {
            try managedContext.save ()
        }
        catch let error as NSError {
            print ("Could not save \(error)")
        }
    }
    static func delete(member: Member) {
        managedContext.delete(member)
        saveMember()
    }
    static func retrieveMembers() -> [Member] {
        let fetchRequest = NSFetchRequest<Member>(entityName: "Member")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print ("Could not fetch \(error.localizedDescription)")
        }
        return []
    }
}
