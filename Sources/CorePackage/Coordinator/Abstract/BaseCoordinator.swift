//
//  Created by Vadim Zhuk on 19.12.20.
//

import Foundation

open class BaseCoordinator: CoordinatorProtocol {

    public let router: Router
    public let factory: ViewControllerFactoryProtocol

    public var childCoordinators: [CoordinatorProtocol] = [] //TODO: Refactor into Set

    public init(router: Router, factory: ViewControllerFactoryProtocol = CPDefaultViewControllerFactory()){
        self.factory = factory
        self.router = router
    }

    open func start(with option: DeepLinkOption? = nil) {}

    func addDependency(_ coordinator: CoordinatorProtocol) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: CoordinatorProtocol?) {
        guard childCoordinators.isEmpty == false,
              let coordinator = coordinator else { return }

        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.removeDependency($0) })
        }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
