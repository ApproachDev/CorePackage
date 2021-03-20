//
//  Created by Vadim Zhuk on 29.12.20.
//

import UIKit

public final class Router: NSObject, RouterProtocol {

    private weak var rootController: UINavigationController?

    public init(rootController: UINavigationController) {
        self.rootController = rootController
    }

    public func setRootModule(_ module: UIViewController?, hideBar: Bool = true) {
        guard let controller = module else { return }
        rootController?.setViewControllers([controller], animated: true)
        rootController?.isNavigationBarHidden = hideBar
    }

    public func present(_ controller: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        rootController?.present(controller, animated: animated, completion: completion)
    }

    public func dismiss(animated: Bool = true, completion: (() -> Void)?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }

    public func push(_ viewController: UIViewController, animated: Bool = true, hideBottomBar: Bool = false, completion: (() -> Void)? = nil) {
        guard (viewController is UINavigationController == false) else { assertionFailure("Deprecated push UINavigationController."); return }

        //    if let completion = completion {
        //      completions[viewController] = completion
        //    }

        viewController.hidesBottomBarWhenPushed = hideBottomBar
        rootController?.pushViewController(viewController, animated: animated)
    }

    func popModule(animated: Bool = true)  {
//        if let controller = rootController?.popViewController(animated: animated) {
            //      runCompletion(for: controller)
//        }
    }

    func popToRootModule(animated: Bool) {
//        if let controllers = rootController?.popToRootViewController(animated: animated) {
            //      controllers.forEach { controller in
            //        runCompletion(for: controller)
            //      }
//        }
    }
}
