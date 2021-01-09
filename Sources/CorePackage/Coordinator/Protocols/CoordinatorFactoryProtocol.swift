//
//  File.swift
//  
//
//  Created by Vadim Zhuk on 2.01.21.
//

import Foundation

public protocol CoordinatorFactoryProtocol {
    
    func makeMainCoordinator(router: Router) -> CoordinatorProtocol

    func makeAuthCoordinator(router: Router) -> CoordinatorProtocol & AuthenticationCoordinatorProtocol

    func makeOnboardingCoordinator(router: Router) -> CoordinatorProtocol & OnboardingCoordinatorResult
}
