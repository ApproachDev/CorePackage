//
//  Created by Vadim Zhuk on 27.02.21.
//

import Foundation

open class DefaultCoordinator: BaseCoordinator {

    public override func start(with option: DeepLinkOption? = nil) {
        let viewController = factory.makeDefaultViewController()
        router.setRootModule(viewController, hideBar: true)
    }
}
