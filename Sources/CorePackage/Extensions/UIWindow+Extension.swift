//
//  File.swift
//  
//
//  Created by Vadim Zhuk on 29.12.20.
//

import UIKit

extension UIWindow {

    func switchRootViewController(_ viewController: UIViewController,
                                  animated: Bool = true,
                                  duration: TimeInterval = 0.5,
                                  options: AnimationOptions = .transitionFlipFromRight,
                                  completion: (() -> Void)? = nil) {

        guard animated else { rootViewController = viewController; return }

        UIView.transition(with: self, duration: duration, options: options) {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        } completion: { _ in
            completion?()
        }
    }
}
