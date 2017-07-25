//
//  Storyboard+Utility.swift
//  FacePass
//
//  Created by Tang Tantivirun on 7/25/17.
//  Copyright © 2017 JT. All rights reserved.
//

import UIKit

extension UIStoryboard {
    enum FPType: String {
        case main
        case login
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    convenience init(type:FPType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle:bundle)
    }
    static func initialViewController(for type: FPType) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
        }
        return initialViewController
    }
}

