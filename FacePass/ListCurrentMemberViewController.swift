//
//  ListCurrentMemberViewController.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/27/17.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage


class ListCurrentMemberViewController: UITableViewController
{
    var posts = [Member]()
    var databaseRef: DatabaseReference!
    var storageRef: StorageReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        databaseRef = Database.database().reference()
        storageRef = Storage.storage().reference()
        
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
        
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "postCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath)as! CustomTableViewCell
        
        let userPostRef = self.databaseRef.child("posts")
        userPostRef.observe(.childAdded, with: {(snapshot) in
            if let postAdd  = snapshot.value as? NSDictionary{
                let myPost = Member(from: snapshot)
                self.posts.insert(myPost!, at:0)
                
                //Dispatch the main thread here
                DispatchQueue.main.async() {
                    cell.nameLabel.text = self.posts[indexPath.row].name
                    
                }
            }
        })
        return cell
}

    @IBAction func unwindToMainVC(_ sender: Any) {
//            let mainVC = UIStoryboard.initialViewController(for: .main)
//            self.view.window?.rootViewController = mainVC
//            self.view.window?.makeKeyAndVisible()
    }
}
