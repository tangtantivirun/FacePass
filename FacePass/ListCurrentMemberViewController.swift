//
//  ListCurrentMemberViewController.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/27/17.
//  Copyright © 2017 JT. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class ListCurrentMemberViewController: UITableViewController
{
    var ref: DatabaseReference!
    var refHandle: UInt!
    var memberList = [Cell]()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(handleCancel))
        
        fetchMembers()
//        ref = Database.database().reference()
//        fetchMembers()
    }
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) ->Int {
        return memberList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        //set cell contents (what goes inside the cells)
        cell.textLabel!.text = memberList[indexPath.row].name
        
        return cell
    }
    func fetchMembers() {
        
//        refHandle = ref.child("members").observe(.childAdded, with: { (snapshots) in
//        if let dictionary = snapshots.value as? [String: AnyObject] {
//        print(dictionary)
//            
//        let member = Cell()
//            
//        member.setValuesForKeys(dictionary)
//        self.memberList.append(member)
//            
//        DispatchQueue.main.async(execute: {
//        self.tableView.reloadData()
//                })
//            }
//        })
//            
    }
    
}

//    var ref: DatabaseReference!
//    var refHandle: UInt!
//    var memberList = [Cell]()
//    
//    let cellId = "cellId"
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//    }
////        ref = Database.database().reference()
////        fetchMembers()
//
//
//    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) ->Int {
//       return 5
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
//       
//        //set cell contents (what goes inside the cells)
//        cell.textLabel?.text = "I love bunnies"
//        
//        return cell
//    }
//    func fetchMembers(){
//        refHandle = ref.child("members").observe(.childAdded, with: { (snapshots) in
//            if let dictionary = snapshots.value as? [String: AnyObject] {
//                print(dictionary)
//               
//                let member = Cell()
//                
//                member.setValuesForKeys(dictionary)
//                self.memberList.append(member)
//               
//                DispatchQueue.main.async(execute: {
//                    self.tableView.reloadData()
//                })
//            }
//        })
//
//    }
//    
//     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//    
//     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return posts.count
//        
//    }
//     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cellIdentifier = "postCell"
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath)as! CustomTableViewCell
//        
//        let userPostRef = self.databaseRef.child("posts")
//        userPostRef.observe(.childAdded, with: {(snapshot) in
//            if let postAdd  = snapshot.value as? NSDictionary{
//                let myPost = Member(from: snapshot)
//                self.posts.insert(myPost!, at:0)
//                
//                //Dispatch the main thread here
//                DispatchQueue.main.async() {
//                    cell.nameLabel.text = self.posts[indexPath.row].name
//                    
//                }
//            }
//        })
//        return cell
//}
//
//    @IBAction func unwindToMainVC(_ sender: Any) {
////            let mainVC = UIStoryboard.initialViewController(for: .main)
////            self.view.window?.rootViewController = mainVC
////            self.view.window?.makeKeyAndVisible()
//    }
//}
