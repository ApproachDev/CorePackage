//
//  Created by Vadim Zhuk on 1.01.21.
//

import Foundation

fileprivate var onboardingWasShown = false
fileprivate var isAutorized = false

class AppState {
    enum FlowInstruction {
        case main, auth, onboarding
    }

    static var flowInstruction: FlowInstruction {
        switch (onboardingWasShown, isAutorized) {
            case (_, false): return .auth
            case (false, true): return .onboarding
            case (true, true): return .main
        }
    }
}


public final class ApplicationCoordinator: BaseCoordinator {

    private let coordinatorFactory: CoordinatorFactoryProtocol

    public init(router: Router, factory: CoordinatorFactoryProtocol) {
        self.coordinatorFactory = factory
        super.init(router: router)
    }

    public override func start(with option: DeepLinkOption?) {
        if let option = option {
            switch option {
                case .onboarding: runOnboardingFlow()
                case .signUp: runAuthFlow()
                default: childCoordinators.forEach { coordinator in //TODO: refactor into runMain with option
                    coordinator.start(with: option)
                }
            }
        } else {
            switch AppState.flowInstruction {
                case .onboarding: runOnboardingFlow()
                case .auth: runAuthFlow()
                case .main: runMainFlow()
            }
        }
    }

    private func runAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            isAutorized = true
            self?.start(with: nil)
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start(with: nil)
    }

    private func runOnboardingFlow() {
        let coordinator = coordinatorFactory.makeOnboardingCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            onboardingWasShown = true
            self?.start(with: nil)
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start(with: nil)
    }

    private func runMainFlow() {
        let coordinator = coordinatorFactory.makeMainCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start(with: nil)
    }
}
