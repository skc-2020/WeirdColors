//
//  ColorsComponent.swift
//  WeirdColors
//
//  Created by AndUser on 09.01.2021.
//  Copyright © 2021 Me. All rights reserved.
//

import UIKit

final class ColorsComponent: UIView {

    typealias ButtonHandler = (UIColor?) -> Void

    // MARK: - Private variables

    private var closureHandler: ButtonHandler?

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 50
        stackView.backgroundColor = .white

        return stackView
    }()

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

extension ColorsComponent {

    struct Model {
        let colorViews: [ColorButton.Model]
        let handler: ButtonHandler
    }

    func configure(with model: Model) {
        closureHandler = model.handler
        createViews(with: model.colorViews)
    }
}

private extension ColorsComponent {
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubviews(views: stackView)
    }
}

// MARK: - Create Views

extension ColorsComponent {
    func createViews(with model: [ColorButton.Model]) {
        model.forEach {
            let button = ColorButton()
            button.configure(with: $0)
            button.layer.cornerRadius = 30
            button.addTarget(self,
                             action: #selector(changeColor(button:)),
                             for: UIControl.Event.touchUpInside)

            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 60),
                button.heightAnchor.constraint(equalToConstant: 60)
            ])

            stackView.addArrangedSubview(button)
        }
    }
}

//MARK: - Button Actions

extension ColorsComponent {
    @objc func changeColor(button: UIButton) {
        closureHandler?(button.backgroundColor)
    }
}
