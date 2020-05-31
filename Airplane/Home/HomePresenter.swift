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
    func prepareForRouter(user: UserResult)
    func passengers(number: Int)
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
    
    func passengers(number: Int) {
        self.interactor.fetchRequest(numberOfUsers: number) { (result) in
            switch result {
            case .success(data: let data):
                guard let users = data as? Users, let usersData = users.results else { return }
                self.view?.update(data: usersData)
            case .failed(error: let error):
                print("Error: \(error?.description)")
            }
        }
    }
    
    func prepareForRouter(user: UserResult) {
        router.goToDetail(user: user)
    }
    
    func viewDidLoad() {
        self.interactor.fetchRequest(numberOfUsers: 99) { (result) in
            switch result {
            case .success(data: let data):
                guard let users = data as? Users, let usersData = users.results else { return }
                self.view?.update(data: usersData)
            case .failed(error: let error):
                print("Error: \(error?.description)")
            }
        }
    }
    
}
