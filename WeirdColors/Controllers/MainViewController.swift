//
//  ViewController.swift
//  WeirdColors
//
//  Created by AndUser on 09.01.2021.
//  Copyright © 2021 Me. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Private variables

     let wellcomeLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "Enter some text"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 24)
        label.backgroundColor = #colorLiteral(red: 0.2061868012, green: 0.814225018, blue: 0.3655812144, alpha: 1)
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true

        return label
    }()

    private let textField: CustomTextField = {
        let textField = CustomTextField()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 24)
 
        return textField
    }()

    private let enterButton: CustomButton = {
       let button = CustomButton()
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2061868012, green: 0.814225018, blue: 0.3655812144, alpha: 1), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 35)
        button.addTarget(self,
                         action: #selector(sendText),
                         for: UIControl.Event.touchUpInside)
        return button
    }()

    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupSubviews()
    }

}

//MARK: - Button Actions

private extension MainViewController {
    @objc func sendText() {
        let secondVC = SecondViewController()
        secondVC.textLabel.text = textField.text ?? ""
        present(secondVC, animated: true, completion: nil)
    }
}

//MARK: - View Setup

private extension MainViewController {
    func setupView() {
        view.addSubviews(views: wellcomeLabel, textField, enterButton)

        view.backgroundColor = .lightGray
    }
}

//MARK: - Subviews Setup

private extension MainViewController {
    func setupSubviews() {
        NSLayoutConstraint.activate([
            wellcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            wellcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            wellcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            wellcomeLabel.heightAnchor.constraint(equalToConstant: 80),

            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            textField.topAnchor.constraint(equalTo: wellcomeLabel.bottomAnchor, constant: 180),

            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            enterButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
            enterButton.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
}
