//
//  NavigationBuilder.swift
//  Airplane
//
//  Created by Carlos on 24/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
    static func build(rootView: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootView)
        return navigationController
    }
    
}
