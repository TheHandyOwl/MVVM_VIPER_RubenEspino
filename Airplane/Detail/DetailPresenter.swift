//
//  DetailPresenter.swift
//  Airplane
//
//  Created by Carlos on 28/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation

protocol DetailPresentation {
    func viewDidLoad()
}

class DetailPresenter {
    
    weak var view : DetailView?
    var interactor : DetailUseCase
    var router : DetailRouter
    
    init(view : DetailView, interactor : DetailUseCase, router : DetailRouter ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension DetailPresenter : DetailPresentation {
    
    func viewDidLoad() {
        
    }
    
}
