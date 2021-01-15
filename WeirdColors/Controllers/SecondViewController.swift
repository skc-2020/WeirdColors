//
//  SecondViewController.swift
//  WeirdColors
//
//  Created by AndUser on 09.01.2021.
//  Copyright © 2021 Me. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Private variables

    private let colorsComponent = ColorsComponent()
    private let colors = Colors()

    // MARK: - Public variables

    let textLabel: CustomLabel = {
        let label = CustomLabel()
        label.textAlignment = .center

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView(with: colors.colorsArray)
        setupSubviews()
    }
}

//MARK: - View Setup

private extension SecondViewController {
    func setupView(with colorsArray: [UIColor]) {
        view.addSubviews(views: textLabel, colorsComponent)
        view.backgroundColor = .systemTeal

        for color in colorsArray {
            colorsComponent.configure(with:
                .init(colorViews: [.init(backgroundColor: color)],
                      handler: { color in self.textLabel.textColor = color }
                )
            )
        }
    }
}

//MARK: - Subviews Setup

private extension SecondViewController {
    func setupSubviews() {
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            textLabel.heightAnchor.constraint(equalToConstant: 148),

            colorsComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            colorsComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            colorsComponent.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 53),
            colorsComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -474),
        ])
    }
}
