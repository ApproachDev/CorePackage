//
//  Created by Vadim Zhuk on 1.01.21.
//

import Foundation

public final class ApplicationCoordinator: BaseCoordinator {

    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let appStateManager: AppStateManagerProtocol

    public init(router: Router, factory: CoordinatorFactoryProtocol, appStateManager: AppStateManagerProtocol) {
        self.appStateManager = appStateManager
        self.coordinatorFactory = factory
        super.init(router: router)
    }

    public override func start(with option: DeepLinkOption?) {
        if let option = option {
            switch option {
                case .onboarding: runOnboardingFlow()
                case .signUp: runAuthFlow()
                default: childCoordinators.forEach { coordinator in
                    coordinator.start(with: option)
                }
            }
        } else {
            runDependOn(flowInstruction: appStateManager.flowInstruction)
        }
    }

    private func runDependOn(flowInstruction: FlowInstruction) {
        switch flowInstruction {
            case .onboarding: runOnboardingFlow()
            case .auth: runAuthFlow()
            case .main: runMainFlow()
        }
    }

    private func runAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.start(with: nil)
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start(with: nil)
    }

    private func runOnboardingFlow() {
        let coordinator = coordinatorFactory.makeOnboardingCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.appStateManager.onboardingDidShow()
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
