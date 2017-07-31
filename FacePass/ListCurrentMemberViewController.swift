//
//  ListCurrentMemberViewController.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/27/17.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import UIKit


class ListCurrentMemberViewController: UIViewController
{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = CoreDataHelper.retrieveNote()!
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? )
    {
        if let identifier = segue.identifier
        {
            if identifier == "displayNote"
            {
                let indexPath = tableView.indexPathForSelectedRow!
                let note = notes[indexPath.row]
                let displayNoteViewController = segue.destination as! DisplayNoteViewController
                displayNoteViewController.note = note
                print("Table view cell tapped")
            }
            else if identifier == "addNote"
            {
                print("+ button tapped")
            }
        }
    }
 
}
