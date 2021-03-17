//
//  Created by Vadim Zhuk on 6.01.21.
//

import Foundation

class AuthCoordinator: BaseCoordinator, AuthenticationCoordinatorProtocol {

    var finishFlow: (() -> Void)?

    override func start(with option: DeepLinkOption? = nil) {
        super.start(with: option)
        showLogin()
    }

    //MARK: - Subflows

    func showLogin() {
        //check if login vc exists - in case of going back from signup
        let loginViewController = factory.makeLogInViewController()
        loginViewController.loginDelegate = self
        router.setRootModule(loginViewController)
    }

    func showSignUp() {
        //check if signup vc exists - in case of going back from login
        let signUpView = factory.makeSignUpViewController()
        router.push(signUpView)
    }

    func completeLogin() {
        finishFlow?()
    }

    func completeSignUp() {
        finishFlow?()
    }
}
