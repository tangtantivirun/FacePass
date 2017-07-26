//
//  AddNewMemberViewController.swift
//  FacePass
//
//  Created by Jennifer Gao on 26/7/2017.
//  Copyright © 2017 JT. All rights reserved.
//

import UIKit


class AddNewMemberViewController: UIViewController
{
    
    @IBOutlet weak var addMemberButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSelector: UISegmentedControl!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddMemberButtonTapped(_ sender: Any) {
    
    
    }
    
}
