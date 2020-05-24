//
//  HomePresenter.swift
//  Airplane
//
//  Created by Carlos on 23/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad()
}

class HomePresenter {
    
    weak var view : HomeView?
    var interactor : HomeUseCase
    var router : HomeRouting
    
    init(view: HomeView, interactor: HomeUseCase, router: HomeRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension HomePresenter : HomePresentation {
    func viewDidLoad() {
        
    }
    
}
