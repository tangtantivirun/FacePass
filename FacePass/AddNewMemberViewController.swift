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
    var gender: Gender?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileImageView.image = image
    }
    @IBAction func genderSelected(_ sender: UISegmentedControl) {
        switch genderSelector.selectedSegmentIndex {
        case 0:
            gender = Gender.Male
        case 1:
            gender = Gender.Female
        case 2:
            gender = Gender.Other
        default:
            break
            
        }
    }

    @IBAction func AddMemberButtonTapped(_ sender: Any) {
        guard let id = idTextField.text,
        !id.isEmpty else {
            return
        }
        
        MemberService.create(image: image, name:nameTextField.text! , birthday: birthdayTextField.text!, gender: gender!, email: emailTextField.text!, phone: phoneTextField.text!, id: id) { (newMember) in
                    guard let newMember = newMember else {
                    return
            }
                Member.setCurrent(newMember, writeToMemberDefaults: true)

            }
           // self.performSegue(withIdentifier: "addMemberInfo", sender: nil)
            
        }

    
    }
    

