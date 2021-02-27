//
//  Created by Vadim Zhuk on 5.01.21.
//

import Foundation

public protocol OnboardingCoordinatorProtocol: OnboardingCoordinatorDelegate {
    var finishFlow: (() -> Void)? { get set }
}

public protocol OnboardingCoordinatorDelegate: AnyObject {
    func finishOnboarding()
}
