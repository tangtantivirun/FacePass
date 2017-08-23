//
//  DisplayInfoViewController.swift
//  FacePass
//
//  Created by Jennifer Gao on 31/7/2017.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import UIKit


class DisplayInfoViewController: UIViewController
{
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var membershipIDLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var checkEnteringButtonTapped: UIButton!
    var member: Member?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let member = member
        {
            nameLabel.text = member.name
            birthdayLabel.text = member.birthday
            genderLabel.text = member.gender.rawValue
            emailLabel.text = member.email
            phoneLabel.text = member.phone
            membershipIDLabel.text = member.id
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let identifier = segue.identifier
        {
            if identifier == "cancel"
            {
                print("Cancel button tapped")
            }
        }
    }
}
