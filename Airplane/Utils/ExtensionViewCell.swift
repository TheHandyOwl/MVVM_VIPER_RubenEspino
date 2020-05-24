//
//  ExtensionViewCell.swift
//  Airplane
//
//  Created by Carlos on 24/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

extension UITableViewCell {

    func configureShadow(view: UIView) {
            view.layer.cornerRadius = 8.0
            view.layer.shadowColor = UIColor.gray.cgColor
            view.layer.shadowOffset = CGSize.zero
            view.layer.shadowOpacity = 0.6
        }

}
