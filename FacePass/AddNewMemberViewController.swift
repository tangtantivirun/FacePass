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
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var genderSelector: UISegmentedControl!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileImageView.image = image
    }
    
    @IBAction func AddMemberButtonTapped(_ sender: Any) {
        guard let id = idTextField.text,
        !id.isEmpty else {
            return
        }
        
        MemberService.create(image: image, name: "", birthday: "", gender: false, email: "", phone: "", id: id) { newMember in
            if let member = newMember {
                // do stuff
                // TODO
            }
            self.performSegue(withIdentifier: "addMemberInfo", sender: nil)
            
        }

    
    }
    
}
