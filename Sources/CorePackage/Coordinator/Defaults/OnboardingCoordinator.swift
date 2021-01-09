//
//  File.swift
//  
//
//  Created by Vadim Zhuk on 5.01.21.
//

import Foundation

public protocol OnboardingCoordinatorResult: class {
  var finishFlow: (() -> Void)? { get set }
}
