//
//  File.swift
//  
//
//  Created by Vadim Zhuk on 6.01.21.
//

import Foundation

public protocol AuthenticationCoordinatorProtocol: AuthCoordinatorDelegate {
    var finishFlow: (() -> Void)? { get set }
}

public protocol AuthCoordinatorDelegate: AnyObject {
    func completeLogin()
    func completeSignUp()

    func showSignUp()
    func showLogin()
}
