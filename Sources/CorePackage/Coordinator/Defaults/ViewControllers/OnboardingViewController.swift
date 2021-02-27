//
//  Created by Vadim Zhuk on 22.01.21.
//

import UIKit
import CorePackage

class OnboardingViewController: UIViewController, OnboardingScreen {

    var delegate: OnboardingCoordinatorDelegate?

    lazy var finishOnboardingButton: Button = {
        let buttonAction: () -> Void = { [weak self] in
            self?.delegate?.finishOnboarding()
        }

        let button = Button(action: buttonAction)
        button.setTitle("Finish onboarding", for: .normal)
        button.backgroundColor = .systemTeal
        return button
    }()

    override func loadView() {
        super.loadView()
        view.backgroundColor = .magenta
        view.addSubview(finishOnboardingButton)
        finishOnboardingButton.centerInSuperview()
    }
}
