//
//  ViewExtensions.swift
//  WeirdColors
//
//  Created by AndUser on 09.01.2021.
//  Copyright © 2021 Me. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
