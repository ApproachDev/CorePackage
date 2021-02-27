//
//  AppState.swift
//  
//
//  Created by Vadim Zhuk on 27.02.21.
//

import Foundation

public final class AppState {

    static let shared = AppState()
    private init() {}

    private var onboardingWasShown = false
    private var isAuthorized = false

    enum FlowInstruction {
        case main, auth, onboarding
    }

    var flowInstruction: FlowInstruction {
        switch (onboardingWasShown, isAuthorized) {
            case (_, false): return .auth
            case (false, true): return .onboarding
            case (true, true): return .main
        }
    }

    func onboardingDidShow() {
        onboardingWasShown = true
    }

    func setAuthorized(_ isAuthorized: Bool) {
        self.isAuthorized =  isAuthorized
    }
}
