//
//  Created by Vadim Zhuk on 27.02.21.
//

import Foundation

public protocol AppStateManagerProtocol {
    var flowInstruction: FlowInstruction { get }
    func onboardingDidShow()
}

public enum FlowInstruction {
    case main, auth, onboarding
}
