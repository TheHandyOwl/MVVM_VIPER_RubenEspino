//
//  HomeRouter.swift
//  Airplane
//
//  Created by Carlos on 23/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

protocol HomeRouting {
    
}

class HomeRouter {
    
    var view : UIViewController
    init(view : UIViewController) {
        self.view = view
    }
    
}

extension HomeRouter : HomeRouting {
    
}
