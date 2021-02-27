//
//  Created by Vadim Zhuk on 27.02.21.
//

import Foundation

public protocol CoordinatorFactoryProtocol {

    func makeMainCoordinator(router: Router) -> CoordinatorProtocol

    func makeAuthCoordinator(router: Router) -> CoordinatorProtocol & AuthenticationCoordinatorProtocol

    func makeOnboardingCoordinator(router: Router) -> CoordinatorProtocol & OnboardingCoordinatorProtocol
}

public extension CoordinatorFactoryProtocol {

    func makeMainCoordinator(router: Router) -> CoordinatorProtocol {
        DefaultCoordinator(router: router)
    }

    func makeAuthCoordinator(router: Router) -> CoordinatorProtocol & AuthenticationCoordinatorProtocol {
        AuthCoordinator(router: router)
    }

    func makeOnboardingCoordinator(router: Router) -> CoordinatorProtocol & OnboardingCoordinatorProtocol {
        OnboardingCoordinator(router: router)
    }
}

//MARK:- FACTORY
public class FlowCoordinatorFactory: CoordinatorFactoryProtocol {
    public init() {}
}
