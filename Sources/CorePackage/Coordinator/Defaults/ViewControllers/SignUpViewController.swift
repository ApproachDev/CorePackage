//
//  Created by Vadim Zhuk on 22.01.21.
//

import UIKit

class SignupViewController: UIViewController, SignupScreen {
    
    weak var delegate: AuthCoordinatorDelegate?

    lazy var signUpButton: Button = {
        let buttonAction: () -> Void = { [weak self] in
            self?.delegate?.completeSignUp()
        }
        let button = Button(action: buttonAction)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .systemTeal
        return button
    }()

    override func loadView() {
        super.loadView()
        view.backgroundColor = .purple
        view.addSubview(signUpButton)
        signUpButton.centerInSuperview()
    }
}
