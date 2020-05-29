//
//  DetailAssembly.swift
//  Airplane
//
//  Created by Carlos on 28/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class DetailAssembly {
    
    static func build(dato: UserResult) -> UIViewController {
        
        let view = DetailViewController(nibName: "DetailViewController", bundle: Bundle.main)
        
        let interactor = DetailInteractor()
        let router = DetailRouter(view: view)
        let presenter = DetailPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        view.update(dato: dato)
        
        return view
    }
    
}
