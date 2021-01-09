//
//  File.swift
//  
//
//  Created by Vadim Zhuk on 3.01.21.
//

import UIKit

public protocol ViewControllerFactoryProtocol {
    
    func makeSignUpViewController() -> SignupScreen

    func makeLogInViewController() -> LoginScreen

    func makeOnboardingController() -> OnboardingScreen
}

public protocol SignupScreen: UIViewController {
    var onCompleteSignup: (() -> Void)? { get set }
    var onSwitchToLoginButtonTap: (() -> Void)? { get set }
}

public protocol LoginScreen: UIViewController {
    var onCompleteLogin: (() -> Void)? { get set }
    var onSwitchToSignupButtonTap: (() -> Void)? { get set }
}

public protocol OnboardingScreen: UIViewController {
    var onFinish: (() -> Void)? { get set }
}

public protocol TabBarController: UITabBarController {
    var onViewDidLoad: ((UINavigationController) -> ())? { get set }
    var onItemFlowSelect: ((UINavigationController) -> ())? { get set }
    //  var onSettingsFlowSelect: ((UINavigationController) -> ())? { get set }
}

