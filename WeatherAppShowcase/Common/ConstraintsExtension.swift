//
//  ConstarintsExtensions.swift
//  ExampleAllProgrammatically
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    public class func useAndActivateConstraints(constraints: [NSLayoutConstraint]) {
        for constraint in constraints {
            if let view = constraint.firstItem as? UIView {
                view.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        activate(constraints)
    }
}
