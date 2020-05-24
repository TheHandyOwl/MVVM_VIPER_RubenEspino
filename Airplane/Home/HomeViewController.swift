//
//  ViewController.swift
//  Airplane
//
//  Created by Carlos on 23/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

protocol HomeView : class {
    func update(data: [UserResult])
}

class HomeViewController: UIViewController {

    var presenter : HomePresenter?
    var userData : [UserResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }

}

extension HomeViewController : HomeView {
    
    func update(data: [UserResult]) {
        userData = data
        userData.forEach { (user) in
            if let userMail = user.email {
                print("Mail: \(userMail)")
            }
        }
    }
    
}

