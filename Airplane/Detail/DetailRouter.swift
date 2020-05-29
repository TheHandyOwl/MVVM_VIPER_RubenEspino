//
//  DetailRouter.swift
//  Airplane
//
//  Created by Carlos on 28/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

protocol DetailRouting {
    func goToDetail(user: UserResult)
}

class DetailRouter {
    
    var view : UIViewController
    init(view: UIViewController) {
        self.view = view
    }
    
}

extension DetailRouter: DetailRouting {
        
        func goToDetail(user: UserResult) {
            let vc = DetailAssembly.build(dato: user)
            self.view.navigationController?.pushViewController(vc, animated: true)
        }
    
}
