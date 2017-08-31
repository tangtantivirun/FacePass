//
//  FaceDetectionViewController.swift
//  FacePass
//
//  Created by Jennifer Gao on 24/7/2017.
//  Copyright © 2017 JT. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
class FaceDetectionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
}


