//
//  MemberList.swift
//  TableView
//
//  Created by Tang Tantivirun on 9/14/17.
//  Copyright © 2017 Tantivirun. All rights reserved.
//

import UIKit

class MemberList: UITableViewController {
     let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) ->Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        //set cell contents (what goes inside the cells)
        cell.textLabel?.text = "I love bunnies"
        
        return cell
    }
}
