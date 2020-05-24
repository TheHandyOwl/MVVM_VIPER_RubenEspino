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
        
        navigationController.navigationBar.barTintColor = UIColor.systemBlue
        navigationController.navigationBar.backgroundColor = UIColor.systemBlue
        
        let font = UIFont.systemFont(ofSize: 50)
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.red
        shadow.shadowBlurRadius = 5
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font : font,
            .foregroundColor : UIColor.white,
            .shadow : shadow
        ]
        navigationController.navigationBar.titleTextAttributes = attributes
        navigationController.navigationBar.largeTitleTextAttributes = attributes
        navigationController.navigationBar.prefersLargeTitles = true

        if #available(iOS 13, *) {
            let apparence = UINavigationBarAppearance()
            apparence.backgroundColor = UIColor.systemBlue
            apparence.configureWithOpaqueBackground()
            apparence.titleTextAttributes = attributes
            apparence.largeTitleTextAttributes = attributes
            /*
            navigationController.navigationBar.standardAppearance = apparence
            navigationController.navigationBar.compactAppearance = apparence
            navigationController.navigationBar.scrollEdgeAppearance = apparence
             */
        } else {
            print("It is not iOS 13")
        }

        return navigationController
        
    }
    
}
