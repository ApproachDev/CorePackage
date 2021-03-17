//
//  Created by Vadim Zhuk on 27.02.21.
//

import Foundation

class OnboardingCoordinator: BaseCoordinator, OnboardingCoordinatorProtocol {
    
    var finishFlow: (() -> Void)?

    override func start(with option: DeepLinkOption? = nil) {
        super.start(with: option)
        showOnboarding()
    }

    func showOnboarding() {
        let onboardingViewController = factory.makeOnboardingController()
        onboardingViewController.onboardingDelegate = self
        router.setRootModule(onboardingViewController)
    }
    
    func finishOnboarding() {
        finishFlow?()
    }
}
