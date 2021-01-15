//
//  InnerView.swift
//  WeirdColors
//
//  Created by AndUser on 10.01.2021.
//  Copyright © 2021 Me. All rights reserved.
//

import UIKit

final class ColorButton: UIButton {

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Configuration

extension ColorButton {

    struct Model {
        let backgroundColor: UIColor
    }

    func configure(with model: Model) {
        backgroundColor = model.backgroundColor
        layer.cornerRadius = 30
    }

}
