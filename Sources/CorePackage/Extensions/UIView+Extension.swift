//
//  File.swift
//  
//
//  Created by Vadim Zhuk on 5.01.21.
//

import UIKit

public extension UIView {
    func centerInSuperview() {
        guard let superview = superview else {
            return //add assert
        }

        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
    }
}
