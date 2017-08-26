//
//  ListCurrentMemberViewController.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/27/17.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import UIKit


class ListCurrentMemberViewController: UITableViewController
{
    var members = [Member]()
    {
        didSet
        {
            tableView.reloadData()    //what is tableView
//            members.insert(notes[notes.count-1], at: 0)
//            members.remove(at: notes.count-1)
        }
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
//        notes = CoreDataHelper.retrieveNote()!
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? )
    {
        if let identifier = segue.identifier
        {
            if identifier == "displayNote"
            {
                let indexPath = tableView.indexPathForSelectedRow!
                let member = members[indexPath.row]
                let displayInfoViewController = segue.destination as! DisplayInfoViewController
                displayInfoViewController.member = member
                print("Table view cell tapped")
            }
           
        }
    }
    @IBAction func unwindToMainVC(_ sender: Any) {
            let mainVC = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = mainVC
            self.view.window?.makeKeyAndVisible()
    }
}
