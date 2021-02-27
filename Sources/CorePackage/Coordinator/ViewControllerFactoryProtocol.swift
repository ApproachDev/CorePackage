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
    var delegate: AuthCoordinatorDelegate? { get set }
}

public protocol LoginScreen: UIViewController {
    var delegate: AuthCoordinatorDelegate? { get set }
}

public protocol OnboardingScreen: UIViewController {
    var delegate: OnboardingCoordinatorDelegate? { get set }
}

public protocol TabBarController: UITabBarController {
    var onViewDidLoad: ((UINavigationController) -> ())? { get set }
//    var onItemFlowSelect: ((UINavigationController) -> ())? { get set }
    //  var onSettingsFlowSelect: ((UINavigationController) -> ())? { get set }
}

