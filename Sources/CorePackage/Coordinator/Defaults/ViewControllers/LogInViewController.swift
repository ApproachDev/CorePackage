//
//  Created by Vadim Zhuk on 22.01.21.
//

import UIKit

class LoginViewController: UIViewController, LoginScreen {

    weak var loginDelegate: AuthCoordinatorDelegate?

    lazy var logInButton: Button = {
        let buttonAction: () -> Void = {[weak self] in
            self?.loginDelegate?.completeLogin()
        }
        let button = Button(action: buttonAction)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemTeal
        return button
    }()

    override func loadView() {
        super.loadView()
        view.backgroundColor = .cyan
        view.addSubview(logInButton)
        logInButton.centerInSuperview()
    }
}
