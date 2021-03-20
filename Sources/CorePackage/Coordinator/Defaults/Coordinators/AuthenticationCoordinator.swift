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
        let loginViewController = factory.makeLogInViewController()
        loginViewController.loginDelegate = self
        router.setRootModule(loginViewController)
    }

    func showSignUp() {
        let signUpView = factory.makeSignUpViewController()
        router.setRootModule(signUpView)
    }

    func completeLogin() {
        finishFlow?()
    }

    func completeSignUp() {
        finishFlow?()
    }
}
