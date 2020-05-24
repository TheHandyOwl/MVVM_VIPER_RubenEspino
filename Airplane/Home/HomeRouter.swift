//
//  HomeRouter.swift
//  Airplane
//
//  Created by Carlos on 23/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

protocol HomeRouting {
    func goToDetail(user: UserResult)
}

class HomeRouter {
    
    var view : UIViewController
    init(view : UIViewController) {
        self.view = view
    }
    
}

extension HomeRouter : HomeRouting {
    
    func goToDetail(user: UserResult) {
        let vc = DetailViewController(nibName: "DetailViewController", bundle: Bundle.main)
        vc.userData = user
        self.view.present(vc, animated: true)
    }
    
}
