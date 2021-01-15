//
//  CustomTextfield.swift
//  WeirdColors
//
//  Created by AndUser on 10.01.2021.
//  Copyright © 2021 Me. All rights reserved.
//

import UIKit

final class CustomTextField: UITextField {

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configuration

private extension CustomTextField {
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
