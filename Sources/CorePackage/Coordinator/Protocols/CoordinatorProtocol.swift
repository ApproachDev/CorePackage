//
//  File.swift
//  
//
//  Created by Vadim Zhuk on 29.12.20.
//

import Foundation

public protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set } //TODO: Refactor into Set
//    var parentCoordinator: Coordinator? { get set }

    func start(with option: DeepLinkOption?)
}
