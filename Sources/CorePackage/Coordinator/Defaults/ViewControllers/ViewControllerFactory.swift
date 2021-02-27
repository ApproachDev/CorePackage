//
//  Created by Vadim Zhuk on 27.02.21.
//

import UIKit

public protocol ViewControllerFactoryProtocol {

    func makeDefaultViewController() -> UIViewController

    func makeSignUpViewController() -> SignupScreen

    func makeLogInViewController() -> LoginScreen

    func makeOnboardingController() -> OnboardingScreen
}

public extension ViewControllerFactoryProtocol {

    func makeDefaultViewController() -> UIViewController {
        return UIViewController()
    }

    func makeSignUpViewController() -> SignupScreen {
        return SignupViewController()
    }

    func makeLogInViewController() -> LoginScreen {
        return LoginViewController()
    }

    func makeOnboardingController() -> OnboardingScreen {
        return OnboardingViewController()
    }
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

//MARK:- FACTORY
public class ViewControllerFactory: ViewControllerFactoryProtocol {
    public init() {}
}