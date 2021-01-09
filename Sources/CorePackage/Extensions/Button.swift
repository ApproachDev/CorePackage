//
//  File.swift
//  
//
//  Created by Vadim Zhuk on 5.01.21.
//

import UIKit

open class Button: UIButton {
    private(set) var action: (() -> Void)?

    public init(action: (() -> Void)?) {
        self.action = action
        super.init(frame: .zero)

        addTarget(self, action: #selector(triggerAction(_:)), for: .touchUpInside)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func set(action: (() -> Void)?) {
        self.action = action
    }

    @objc func triggerAction(_ button: Button) {
        action?()
    }
}
