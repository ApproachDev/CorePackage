//
//  File.swift
//  
//
//  Created by Vadim Zhuk on 6.01.21.
//

import Foundation

public protocol AuthenticationCoordinatorProtocol: class {
  var finishFlow: (() -> Void)? { get set }
}
